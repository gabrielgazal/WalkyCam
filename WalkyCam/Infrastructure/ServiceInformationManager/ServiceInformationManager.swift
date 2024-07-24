//
//  ServiceInformationManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 24/07/24.
//

import Foundation
import CoreLocation

protocol ServiceInformationManagerProtocol {
    func updateDate(_ newDate: Date)
    func updateLocation(_ newLocation: CLLocationCoordinate2D)
    func updateCammerInformation(_ newInfo: CammerData)
    func getServiceBasicInformation() -> ServiceBasicInformation
    func getServiceCammerInformation() -> CammerData?
}

class ServiceInformationManager: ServiceInformationManagerProtocol {
    static let shared = ServiceInformationManager()
    private var basicInfo: ServiceBasicInformation = .init()
    private var cammerInformation: CammerData?
    
    public init() {}
    
    
    // MARK: - Public API
    
    public func updateDate(_ newDate: Date) {
        basicInfo.date = newDate
    }
    
    public func updateLocation(_ newLocation: CLLocationCoordinate2D) {
        basicInfo.location = newLocation
    }
    
    public func updateCammerInformation(_ newInfo: CammerData) {
        cammerInformation = newInfo
    }
    
    func getServiceBasicInformation() -> ServiceBasicInformation {
        return basicInfo
    }
    
    func getServiceCammerInformation() -> CammerData? {
        return cammerInformation
    }
}

struct ServiceBasicInformation {
    var date: Date
    var location: CLLocationCoordinate2D
    
    public init(
        date: Date = .now,
        location: CLLocationCoordinate2D = .init()
    ) {
        self.date = date
        self.location = location
    }
}

