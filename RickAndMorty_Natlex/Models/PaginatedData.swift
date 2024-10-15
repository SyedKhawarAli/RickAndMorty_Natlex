//
//  PaginatedData.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 14.10.2024.
//

import Foundation

struct PaginatedData<T: Codable>: Codable {
    let info: Info?
    let results: [T]?
}

struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}
