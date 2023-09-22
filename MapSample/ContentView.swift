//
//  ContentView.swift
//  MapSample
//
//  Created by Cliente on 22/09/23.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D{
    static let bigBen = CLLocationCoordinate2D(latitude: 51.500685, longitude: -0.124570)
    static let towerBridge = CLLocationCoordinate2D(latitude: 51.505507, longitude: -0.075402)
}

struct ContentView: View {
    @State private var position: MapCameraPosition = .automatic
    var body: some View {
           Map(position: $position)
               .onAppear {
                   position = .item(MKMapItem(placemark: .init(coordinate: .bigBen)))
               }
               .safeAreaInset(edge: .bottom) {
                   HStack {
                       Button(action: {
                           withAnimation {
                               position = .item(MKMapItem(placemark: .init(coordinate: .bigBen)))
                           }
                       }) {
                           Text("Big Ben")
                       }
                       .tint(.black)
                       .buttonStyle(.borderedProminent)
    
                       Button(action: {
                           withAnimation {
                               position = .item(MKMapItem(placemark: .init(coordinate: .towerBridge)))
                           }
                       }) {
                           Text("Tower Bridge")
                       }
                       .tint(.black)
                       .buttonStyle(.borderedProminent)
                   }
               }
       }
}
