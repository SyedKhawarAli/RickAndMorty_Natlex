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
    var totalPages: Int?
    var characterSubscription: AnyCancellable?
    
    func getCharactersByFilter(filter: RMCharacterFilter) {
        guard let url = Endpoint.character(filter.query) else { return }
        if pageNumber == 1 {
            allCharacters.removeAll()
        }
        characterSubscription = NetworkingManager.download(url: url)
            .decode(type: PaginatedData<CharacterModel>.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedModel) in
                    self?.totalPages = returnedModel.info?.pages
                if let returnedCharacters = returnedModel.results {
                    for model in returnedCharacters {
                        self?.allCharacters.appendIfNotContains(model)
                    }
                }
                self?.characterSubscription?.cancel()
            })
    }

    func createCharacterFilter(name: String?, status: Status?, species: Species?, type: String?, gender: Gender?) -> RMCharacterFilter {
            
            let parameterDict: [String: String] = [
                "page" : "\(pageNumber)",
                "name" : name ?? "",
                "status" : status?.rawValue ?? "",
                "species" : species?.rawValue ?? "",
                "type" : type ?? "",
                "gender" : gender?.rawValue ?? ""
            ]
            
            var query = ""
            for (key, value) in parameterDict {
                if value != "" {
                    query.append(key+"="+value+"&")
                }
            }
            
            let filter = RMCharacterFilter(name: parameterDict["name"]!, status: parameterDict["status"]!, species: parameterDict["species"]!, type: parameterDict["type"]!, gender: parameterDict["gender"]!, query: query)
            return filter
        }

}

public struct RMCharacterFilter {
    public let name: String
    public let status: String
    public let species: String
    public let type: String
    public let gender: String
    public let query: String
}

extension RangeReplaceableCollection where Element: Equatable {
    @discardableResult
    mutating func appendIfNotContains(_ element: Element) -> (appended: Bool, memberAfterAppend: Element) {
        if let index = firstIndex(of: element) {
            return (false, self[index])
        } else {
            append(element)
            return (true, element)
        }
    }
}
