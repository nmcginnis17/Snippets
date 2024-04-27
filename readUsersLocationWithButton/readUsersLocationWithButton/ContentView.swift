//
//  ContentView.swift
//  readUsersLocationWithButton
//
//  Created by Nicholas McGinnis on 4/26/24.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("My Location coordinats: \(location.latitude), \(location.longitude)")
            }
            
///         ~ Location Button Options ~
//            LocationButton(.currentLocation)
//            LocationButton(.sendCurrentLocation)
//            LocationButton(.sendMyCurrentLocation)
//            LocationButton(.shareMyCurrentLocation)
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .foregroundStyle(.white)
            .font(.title2)
            .clipShape(.capsule)
        }
    }
}

#Preview {
    ContentView()
}
