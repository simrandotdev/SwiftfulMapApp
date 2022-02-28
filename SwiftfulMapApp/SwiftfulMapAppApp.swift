//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Simran Preet Narang on 2022-02-27.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
