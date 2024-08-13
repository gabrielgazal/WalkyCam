import SwiftUI
import MapKit
@_spi(Experimental) import MapboxMaps

final class MapTabViewModel: MapTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: MapTabInteractorProtocol
    private let serviceManager: ServiceInformationManagerProtocol
    @Published var locationText: String = ""
    @State var coordinates: CLLocationCoordinate2D = .init()
    @StateObject var locationManager = LocationPermissionManager()
    @State var isFirstUpdate = true
    @Published var mapView: MapView?
    
    // MARK: - Initialization

    init(interactor: MapTabInteractorProtocol = MapTabInteractor(),
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared) {
        self.interactor = interactor
        self.serviceManager = serviceManager
        updateUserViewPort(manager: locationManager)
    }

    // MARK: - Public API

    func updateCamerLocation() {
        if let userCoordinates = mapView?.mapboxMap.cameraState.center {
            serviceManager.updateLocation(userCoordinates)
        }
    }

    // MARK: - Private Methods
    
    func getUserRegion() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationText) { (placemarks, error) in
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location?.coordinate else { return }
            self.coordinates = location
            self.mapView?.camera.ease(
                to: CameraOptions(
                    center: location,
                    zoom: 15,
                    bearing: 0,
                    pitch: 0
                ),
                duration: 1.0
            )
        }
    }
    
    func updateUserViewPort(manager: LocationPermissionManager) {
        if isFirstUpdate {
            guard let location = manager.coordinates else { return }
            self.mapView?.camera.ease(
                to: CameraOptions(
                    center: location,
                    zoom: 15,
                    bearing: 0,
                    pitch: 0
                ),
                duration: 1.0
            )
            isFirstUpdate = false
        }
    }
    
    func updateUserRegionGeocoder() {
        let coordinates = mapView?.mapboxMap.cameraState.center
        print(coordinates)
    }
}
