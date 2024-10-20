//
//  ApiEnvironment.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 20.10.2024.
//

import Foundation

enum ApiEnvironment {
    case development

    static var current: ApiEnvironment { return .development }

    static var baseUrl: URL? {
        switch current {
        case .development: return URL(string: "https://rickandmortyapi.com/api/")
        }
    }
}
