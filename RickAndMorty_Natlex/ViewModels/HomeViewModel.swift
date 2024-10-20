//
//  HomeViewModel.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCharacters: [CharacterModel] = []
    @Published var filteredCharacters: [CharacterModel] = []
    @Published var allLocations: [LocationModel] = []
    @Published var searchText: String = ""
    @Published var characterStatus: Status = .dead
    @Published var characterSpecie: Species = .alien
    @Published var lastKnownLocation: LocationModel?
    @Published var firstSeenInLocation: LocationModel?
    private var cancellables = Set<AnyCancellable>()

    private let characterDataService = CharacterDataService()
    private let locationDataService = LocationDataService()

    init(){
        addSubscribers()
    }
    
    func filterCharacters() {
        let fileter = characterDataService.createCharacterFilter(name: searchText, status: characterStatus, species: characterSpecie, type: nil, gender: nil)
        characterDataService.pageNumber = 1
        characterDataService.getCharactersByFilter(filter: fileter)
    }
    
    func loadMoreCharacters(){
        let fileter = characterDataService.createCharacterFilter(name: searchText, status: characterStatus, species: characterSpecie, type: nil, gender: nil)
        if characterDataService.pageNumber < characterDataService.totalPages ?? 0 {
            let nextPage = characterDataService.pageNumber + 1
            characterDataService.pageNumber = nextPage
        }
        characterDataService.getCharactersByFilter(filter: fileter)
    }
    
    func loadMoreLocations(){
        if locationDataService.pageNumber < locationDataService.totalPages {
            let nextPage = locationDataService.pageNumber + 1
            locationDataService.getLocations(pageNumber: nextPage)
        }
    }
    
    func addSubscribers(){
        
        Publishers.CombineLatest3($searchText, $characterStatus, $characterSpecie)
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] (searchText, status, species) in
                self?.filterCharacters()
            }
            .store(in: &cancellables)
        
        $searchText
            .combineLatest(characterDataService.$allCharacters)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCharacters)
            .sink { [weak self] returnedCharacters in
                self?.allCharacters = returnedCharacters
            }
            .store(in: &cancellables)
        
        $searchText
            .combineLatest(locationDataService.$allLocations)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterLocations)
            .sink { [weak self] returnedModels in
                self?.allLocations = returnedModels
            }
            .store(in: &cancellables)
        
        Publishers.CombineLatest3($lastKnownLocation, $firstSeenInLocation, characterDataService.$allCharacters)
            .map(filterCharactersLocations)
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] returnedCharacters in
                self?.filteredCharacters = returnedCharacters
            }
            .store(in: &cancellables)
    }
    
    private func filterCharactersLocations(locationOne: LocationModel?, locationTwo: LocationModel?, characters: [CharacterModel]) -> [CharacterModel] {
        if locationOne == nil && locationTwo == nil {
            return characters
        }
        if locationOne == nil {
            return characters.filter { (model) -> Bool in
                return (model.location?.name ?? "") == (locationTwo?.name ?? "")
            }
        }
        if locationTwo == nil {
            return characters.filter { (model) -> Bool in
                return (model.location?.name ?? "") == (locationOne?.name ?? "")
            }
        }
        return characters.filter { (model) -> Bool in
            return (model.location?.name ?? "") == (locationOne?.name ?? "")
            && (model.location?.name ?? "") == (locationTwo?.name ?? "")
        }
    }
    
    private func filterCharacters(text: String, character: [CharacterModel]) -> [CharacterModel] {
        guard !text.isEmpty else {
            return character
        }
        let lowercaseText = text.lowercased()
        
        return character.filter { (model) -> Bool in
            return model.name.lowercased().contains(lowercaseText)
        }
    }
    
    private func filterLocations(text: String, character: [LocationModel]) -> [LocationModel] {
        guard !text.isEmpty else {
            return character
        }
        let lowercaseText = text.lowercased()
        
        return character.filter { (model) -> Bool in
            return model.name?.lowercased().contains(lowercaseText) ?? true
        }
    }
}
