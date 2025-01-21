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
            self.getWalkyCammersOnLocation(coordinates: location) {
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
    }

    func updateUserViewPort(manager: LocationPermissionManager) {
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
    }

    private func getWalkyCammersOnLocation(coordinates: CLLocationCoordinate2D, completion: @escaping () -> Void) {
        let cammers = interactor.getCammersOnLocation(location: coordinates)
        for index in 0..<cammers.count {
            let item = cammers[index]
            let annotation = ViewAnnotation(
                coordinate: .init(
                    latitude: item.coordinates.latitude,
                    longitude: item.coordinates.longitude
                ),
                view: assembleAnnotationView(item)
            )
            mapView?.viewAnnotations.add(annotation)
        }
        completion()
    }
    
    func updateUserRegionGeocoder() {
        guard let location = mapView?.mapboxMap.cameraState.center else { return }
        getWalkyCammersOnLocation(coordinates: location) {
            self.mapView?.camera.ease(
                to: CameraOptions(
                    center: location,
                    bearing: 0,
                    pitch: 0
                ),
                duration: 1.0
            )
        }
    }
    
    func panCameraToLocation() {
        guard let location = mapView?.mapboxMap.cameraState.center else { return }
        self.mapView?.camera.ease(
            to: CameraOptions(
                center: location,
                zoom: 20,
                bearing: 0,
                pitch: 0
            ),
            duration: 1.0
        )
    }
    
    private func assembleAnnotationView(_ item: CammerData) -> UIView {
        let profileImageView = ProfileImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        profileImageView.profileImageURL = URL(string: item.profileImage)
        return profileImageView
    }
}
