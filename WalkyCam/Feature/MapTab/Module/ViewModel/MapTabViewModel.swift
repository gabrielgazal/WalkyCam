import SwiftUI
import MapKit
@_spi(Experimental) import MapboxMaps

final class MapTabViewModel: MapTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: MapTabInteractorProtocol
    @Published var userLocation: Viewport = .idle
    @Published var locationText: String = ""
    @State var coordinates: CLLocationCoordinate2D = .init()

    // MARK: - Initialization

    init(interactor: MapTabInteractorProtocol = MapTabInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API


    // MARK: - Private Methods
    
    func getUserRegion() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationText) { (placemarks, error) in
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location?.coordinate else { return }
            self.coordinates = location
            self.userLocation = Viewport.camera(center: location,
                                        zoom: 15,
                                        bearing: 0,
                                        pitch: 0)
        }
    }
}
