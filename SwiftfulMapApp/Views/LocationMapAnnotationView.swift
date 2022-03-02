//
//  LocationMapAnnotationView.swift
//  SwiftfulMapApp
//
//  Created by Simran Preet Narang on 2022-03-02.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color.accentColor
    
    var body: some View {
        VStack {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(accentColor)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -10)
                .padding(.bottom, 35)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
