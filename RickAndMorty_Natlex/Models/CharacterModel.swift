//
//  CharacterModel.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import Foundation

struct CharacterModel: Codable, Identifiable {
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
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
