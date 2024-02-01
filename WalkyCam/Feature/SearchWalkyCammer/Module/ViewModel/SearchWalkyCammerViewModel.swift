import SwiftUI
import MapKit

final class SearchWalkyCammerViewModel: SearchWalkyCammerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: SearchWalkyCammerInteractorProtocol
    @Published var userLocation: AsyncData<CLLocationCoordinate2D, ErrorProtocol> = .idle
    @Published var locationText: String = ""

    // MARK: - Initialization

    init(interactor: SearchWalkyCammerInteractorProtocol = SearchWalkyCammerInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func getUserRegion() {
        let locationManager = CLLocationManager()
        let delegate = Coordinator(self)
        locationManager.delegate = delegate
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

class Coordinator: NSObject, CLLocationManagerDelegate {
    var parent: SearchWalkyCammerViewModel
    
    init(_ parent: SearchWalkyCammerViewModel) {
        self.parent = parent
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first?.coordinate {
            parent.userLocation = .loaded(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let nsError = error as NSError? {
            parent.userLocation = .failed(GenericError())
        }
    }
    
}
