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
    @Published var searchText: String = ""
    private var cancellables = Set<AnyCancellable>()

    private let characterDataService = CharacterDataService()

    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        $searchText
            .combineLatest(characterDataService.$allCharacters)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCharacters in
                self?.allCharacters = returnedCharacters
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, character: [CharacterModel]) -> [CharacterModel] {
        guard !text.isEmpty else {
            return character
        }
        let lowercaseText = text.lowercased()
        
        return character.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercaseText)
        }
    }
}
