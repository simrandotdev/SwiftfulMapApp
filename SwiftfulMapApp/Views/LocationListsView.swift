//
//  LocationListsView.swift
//  SwiftfulMapApp
//
//  Created by Simran Preet Narang on 2022-02-28.
//

import SwiftUI

struct LocationListsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                listRowView(location: location)
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }.listStyle(.plain)
    }
}

extension LocationListsView {
    private func listRowView(location: Location) -> some View {
        return HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct LocationListsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListsView()
    }
}