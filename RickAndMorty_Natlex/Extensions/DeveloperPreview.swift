//
//  DeveloperPreview.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
//    let stat1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
//    let stat2 = StatisticModel(title: "Total Volume", value: "$1.23Tr")
//    let stat3 = StatisticModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
    
    let allCharacters: [CharacterModel] = try! JSONDecoder().decode([CharacterModel].self, from: json)

}

let json = """
[
{
"id": 1,
"name": "Rick Sanchez",
"status": "Alive",
"species": "Human",
"type": "",
"gender": "Male",
"origin": {
"name": "Earth (C-137)",
"url": "https://rickandmortyapi.com/api/location/1"
},
"location": {
"name": "Citadel of Ricks",
"url": "https://rickandmortyapi.com/api/location/3"
},
"image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
"episode": [
"https://rickandmortyapi.com/api/episode/1",
"https://rickandmortyapi.com/api/episode/2",
],
"url": "https://rickandmortyapi.com/api/character/1",
"created": "2017-11-04T18:48:46.250Z"
},
{
"id": 14,
"name": "Alien Morty",
"status": "unknown",
"species": "Alien",
"type": "",
"gender": "Male",
"origin": {
"name": "unknown",
"url": ""
},
"location": {
"name": "Citadel of Ricks",
"url": "https://rickandmortyapi.com/api/location/3"
},
"image": "https://rickandmortyapi.com/api/character/avatar/14.jpeg",
"episode": [
"https://rickandmortyapi.com/api/episode/10"
],
"url": "https://rickandmortyapi.com/api/character/14",
"created": "2017-11-04T20:51:31.373Z"
},
{
"id": 15,
"name": "Alien Rick",
"status": "unknown",
"species": "Alien",
"type": "",
"gender": "Male",
"origin": {
"name": "unknown",
"url": ""
},
"location": {
"name": "Citadel of Ricks",
"url": "https://rickandmortyapi.com/api/location/3"
},
"image": "https://rickandmortyapi.com/api/character/avatar/15.jpeg",
"episode": [
"https://rickandmortyapi.com/api/episode/10"
],
"url": "https://rickandmortyapi.com/api/character/15",
"created": "2017-11-04T20:56:13.215Z"
},
{
"id": 16,
"name": "Amish Cyborg",
"status": "Dead",
"species": "Alien",
"type": "Parasite",
"gender": "Male",
"origin": {
"name": "unknown",
"url": ""
},
"location": {
"name": "Earth (Replacement Dimension)",
"url": "https://rickandmortyapi.com/api/location/20"
},
"image": "https://rickandmortyapi.com/api/character/avatar/16.jpeg",
"episode": [
"https://rickandmortyapi.com/api/episode/15"
],
"url": "https://rickandmortyapi.com/api/character/16",
"created": "2017-11-04T21:12:45.235Z"
},
{
"id": 17,
"name": "Annie",
"status": "Alive",
"species": "Human",
"type": "",
"gender": "Female",
"origin": {
"name": "Earth (C-137)",
"url": "https://rickandmortyapi.com/api/location/1"
},
"location": {
"name": "Anatomy Park",
"url": "https://rickandmortyapi.com/api/location/5"
},
"image": "https://rickandmortyapi.com/api/character/avatar/17.jpeg",
"episode": [
"https://rickandmortyapi.com/api/episode/3"
],
"url": "https://rickandmortyapi.com/api/character/17",
"created": "2017-11-04T22:21:24.481Z"
},
{
"id": 18,
"name": "Antenna Morty",
"status": "Alive",
"species": "Human",
"type": "Human with antennae",
"gender": "Male",
"origin": {
"name": "unknown",
"url": ""
},
"location": {
"name": "Citadel of Ricks",
"url": "https://rickandmortyapi.com/api/location/3"
},
"image": "https://rickandmortyapi.com/api/character/avatar/18.jpeg",
"episode": [
"https://rickandmortyapi.com/api/episode/10",
"https://rickandmortyapi.com/api/episode/28"
],
"url": "https://rickandmortyapi.com/api/character/18",
"created": "2017-11-04T22:25:29.008Z"
},
{
"id": 19,
"name": "Antenna Rick",
"status": "unknown",
"species": "Human",
"type": "Human with antennae",
"gender": "Male",
"origin": {
"name": "unknown",
"url": ""
},
"location": {
"name": "unknown",
"url": ""
},
"image": "https://rickandmortyapi.com/api/character/avatar/19.jpeg",
"episode": [
"https://rickandmortyapi.com/api/episode/10"
],
"url": "https://rickandmortyapi.com/api/character/19",
"created": "2017-11-04T22:28:13.756Z"
},
{
"id": 20,
"name": "Ants in my Eyes Johnson",
"status": "unknown",
"species": "Human",
"type": "Human with ants in his eyes",
"gender": "Male",
"origin": {
"name": "unknown",
"url": ""
},
"location": {
"name": "Interdimensional Cable",
"url": "https://rickandmortyapi.com/api/location/6"
},
"image": "https://rickandmortyapi.com/api/character/avatar/20.jpeg",
"episode": [
"https://rickandmortyapi.com/api/episode/8"
],
"url": "https://rickandmortyapi.com/api/character/20",
"created": "2017-11-04T22:34:53.659Z"
}
]
""".data(using: .utf8)!
