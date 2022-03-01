//
//  Location.swift
//  SwiftfulMapApp
//
//  Created by Simran Preet Narang on 2022-02-27.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.cityName == rhs.cityName && lhs.name == rhs.name && lhs.description == rhs.description
    }
    
    
    var id: String {
        return name + cityName
    }
    var name: String
    var cityName: String
    var coordinates: CLLocationCoordinate2D
    var description: String
    var imageNames: [String]
    var link: String
}
