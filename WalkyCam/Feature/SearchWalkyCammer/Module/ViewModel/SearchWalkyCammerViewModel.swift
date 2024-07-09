import SwiftUI
import MapKit
@_spi(Experimental) import MapboxMaps

final class SearchWalkyCammerViewModel: SearchWalkyCammerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: SearchWalkyCammerInteractorProtocol

    @Published var userLocation: Viewport = .idle
    @Published var locationText: String = ""
    @Published var currentStep: Int = 1
    @Published var currentTitle: String = "Buscar zona"
    @Published var walkyCammers: AsyncData<[CammerData], ErrorProtocol> = .idle
    @Published var shouldDisplayCammerList: Bool = false
    @State var coordinates: CLLocationCoordinate2D = .init()
    @State var updatedUserLocation = false
    
    // MARK: - Initialization

    init(interactor: SearchWalkyCammerInteractorProtocol = SearchWalkyCammerInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func getUserRegion() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationText) { (placemarks, error) in
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location?.coordinate else { return }
            self.coordinates = location
            self.getWalkyCammersOnLocation(coordinates: location) {
                self.userLocation = Viewport.camera(center: location,
                                            zoom: 15,
                                            bearing: 0,
                                            pitch: 0)
                self.currentStep = 2
                self.currentTitle = "WalkCamers Disponibles"
            }
        }
    }

    func updateUserViewPort(manager: LocationPermissionManager) {
        guard let location = manager.coordinates else { return }
        if !updatedUserLocation {
            getWalkyCammersOnLocation(coordinates: location) {
                self.userLocation = Viewport.camera(center: location,
                                            zoom: 15,
                                            bearing: 0,
                                            pitch: 0)
            }
            updatedUserLocation.toggle()
        }
    }

    private func getWalkyCammersOnLocation(coordinates: CLLocationCoordinate2D, completion: @escaping () -> Void) {
        walkyCammers = .loading
        let cammers = interactor.getCammersOnLocation(location: coordinates)
        walkyCammers = .loaded(cammers)
        completion()
    }
}
