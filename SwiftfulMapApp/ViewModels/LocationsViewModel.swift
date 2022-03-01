//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Simran Preet Narang on 2022-02-28.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location] = []
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    // Show list of location
    @Published var showLocationsList: Bool = false
    
    init() {
        self.locations = LocationsDataService.locations
        self.mapLocation = LocationsDataService.locations.first ?? defaultLocation
        self.updateMapRegion(location: LocationsDataService.locations.first ?? defaultLocation)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        
        // Get the current Index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("❌ Could not find current index in locations array! Should never happen.")
            return
        }
        
        // Check if currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    private let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    private let defaultLocation = Location(
        name: "Colosseum",
        cityName: "Rome",
        coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
        description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
        imageNames: [
            "rome-colosseum-1",
            "rome-colosseum-2",
            "rome-colosseum-3",
        ],
        link: "https://en.wikipedia.org/wiki/Colosseum")
}
