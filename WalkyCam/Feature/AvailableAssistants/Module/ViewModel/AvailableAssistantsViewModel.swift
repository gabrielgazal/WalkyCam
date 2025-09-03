import SwiftUI
import MapKit
@_spi(Experimental) import MapboxMaps

final class AvailableAssistantsViewModel: AvailableAssistantsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AvailableAssistantsInteractorProtocol
    @Published var walkyCammers: AsyncData<[CammerData], ErrorProtocol> = .idle
    @State var coordinates: CLLocationCoordinate2D = .init()
    var mapView: MapView?
    private let serviceManager: ServiceInformationManagerProtocol
    private let locationManager: LocationPermissionManager = .init()
    
    // MARK: - Initialization

    init(interactor: AvailableAssistantsInteractorProtocol,
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared) {
        self.interactor = interactor
        self.serviceManager = serviceManager
    }

    // MARK: - Public API
    
    func configureMapView(_ mapView: MapView) {
        self.mapView = mapView
    }

    func getUserRegion() {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(
            CLLocation(
                latitude: .zero,
                longitude: .zero
            )
        ) { (placemarks, error) in
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location?.coordinate else { return }

            self.coordinates = location
            self.getWalkyCammers(location: location)

            Task { @MainActor in
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

    func getWalkyCammers(location: CLLocationCoordinate2D) {
        walkyCammers = .loading
        Task {
            do {
                let cammers = try await interactor.getCammersOnLocation(location: location)

                await MainActor.run {
                    walkyCammers = .loaded(cammers)
                    serviceManager.updateLocation(location)
                }
                StreetcammerManager.shared.saveStreetCammers(cammers)
            } catch {
                await MainActor.run {
                    walkyCammers = .failed(GenericError())
                }
            }
        }
    }
}
