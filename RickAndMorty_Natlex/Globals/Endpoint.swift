//
//  ApiEndpoints.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 20.10.2024.
//

import Foundation

enum Endpoint {
    // MARK: - EndPoints
    
    static var character: (String) -> URL? = {
        URL(string: "character/?"+$0, relativeTo: ApiEnvironment.baseUrl)
    }
    
    static var location: (Int) -> URL? = {
        URL(string: "location?page=\($0)", relativeTo: ApiEnvironment.baseUrl)
    }
}
