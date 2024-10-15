//
//  LocationModel.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import Foundation

struct LocationModel: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
