//
//  LocationPermissionManager.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 18/03/24.
//

import Foundation
import CoreLocation

class LocationPermissionManager:NSObject, ObservableObject, CLLocationManagerDelegate {

    @Published var authorizationStatus : CLAuthorizationStatus = .notDetermined
    private let locationManager = CLLocationManager()
    @Published var coordinates : CLLocationCoordinate2D?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }

    func requestLocationPermission()  {
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}

        coordinates = location.coordinate
    }
}
