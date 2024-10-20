//
//  LocationDataService.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Shah on 15.10.2024.
//

import Foundation
import Combine

class LocationDataService {
    @Published var allLocations: [LocationModel] = []
    var pageNumber: Int = 1
    var totalPages: Int = 1
    var locationSubscription: AnyCancellable?
    
    init(){
        getLocations(pageNumber: pageNumber)
    }
    
    func getLocations(pageNumber: Int){
        guard let url = Endpoint.location(pageNumber) else { return }
        locationSubscription = NetworkingManager.download(url: url)
            .decode(type: PaginatedData<LocationModel>.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedModel) in
            if let totalPages = returnedModel.info?.pages {
                self?.totalPages = totalPages
            }
                if let returnedLocations = returnedModel.results {
                    if pageNumber == 1 {
                        self?.allLocations.removeAll()
                    }
                    self?.allLocations.append(contentsOf: returnedLocations)
                }
                self?.locationSubscription?.cancel()
            })
    }
    
}
