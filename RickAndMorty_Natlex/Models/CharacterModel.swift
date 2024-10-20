//
//  CharacterModel.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import Foundation

struct CharacterModel: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let status: Status?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: LocationModel?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    
    static func ==(lhs: CharacterModel, rhs: CharacterModel) -> Bool {
        return lhs.id == rhs.id
    }
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}

enum Species: String, Codable, CaseIterable {
    case alien = "Alien"
    case human = "Human"
    case robot = "Robot"
    case humanoid = "Humanoid"
}

enum Status: String, Codable, CaseIterable {
    case dead = "Dead"
    case alive = "Alive"
    case unknown = "unknown"
}
