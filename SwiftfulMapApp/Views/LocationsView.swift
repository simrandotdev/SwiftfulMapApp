//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by Simran Preet Narang on 2022-02-28.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            mapLayer
            
            VStack(spacing: 0) {
                
                header
                    .padding()
                
                Spacer()
                
                locationsPreviewStack
            }
        }.sheet(item: $vm.sheetLocation) {
            LocationDetailView(location: $0)
        }
    }
}

extension LocationsView {
    private var header: some View {
        
        VStack {
            Button(action: {
                vm.toggleLocationsList()
            }) {
                Text("\(vm.mapLocation.name), \(vm.mapLocation.cityName)")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: 1)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            
            if vm.showLocationsList {
                LocationListsView()
            }
        }.background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations) { location in
            
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1.5 : 1)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }.ignoresSafeArea()
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
