//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Simran Preet Narang on 2022-02-28.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location] = []
    
    init() {
        self.locations = LocationsDataService.locations
    }
    
}
