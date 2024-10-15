//
//  CharacterDataService.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import Foundation
import Combine

class CharacterDataService {
    @Published var allCharacters: [CharacterModel] = []
    var pageNumber: Int = 1
    var characterSubscription: AnyCancellable?
    
    init(){
        getCharacters(pageNumber: pageNumber)
    }
    
    func getCharacters(pageNumber: Int){
        guard let url = URL(string: "https://rickandmortyapi.com/api/character?page=\(pageNumber)") else { return }
        
        characterSubscription = NetworkingManager.download(url: url)
            .decode(type: PaginatedData<CharacterModel>.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedModel) in
                if let returnedCharacters = returnedModel.results {
                    self?.allCharacters.append(contentsOf: returnedCharacters)
                }
                self?.characterSubscription?.cancel()
            })
    }
}
