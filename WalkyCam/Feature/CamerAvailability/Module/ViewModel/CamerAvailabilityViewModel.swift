import SwiftUI
import MapKit
@_spi(Experimental) import MapboxMaps

final class CamerAvailabilityViewModel: CamerAvailabilityViewModelProtocol {
    // MARK: - Dependencies

    private let interactor: CamerAvailabilityInteractorProtocol
    @Published var userLocation: Viewport = .idle
    @Published var locationText: String = ""
    @Published var walkyCammers: AsyncData<[CammerData], ErrorProtocol> = .idle
    @Published var shouldDisplayTimes: Bool = false
    @State var coordinates: CLLocationCoordinate2D = .init()
    @Published var tabSelection: WCTopBarItem = .init(iconName: "", title: "")
    @Published var tabBarItems: [WCTopBarItem] = []
    
    // MARK: - Initialization

    init(interactor: CamerAvailabilityInteractorProtocol = CamerAvailabilityInteractor()) {
        self.interactor = interactor
        initializeTabs()
    }

    // MARK: - Public API

    func getUserRegion() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationText) { (placemarks, error) in
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location?.coordinate else { return }
            self.coordinates = location
        }
    }

    func updateUserViewPort(manager: LocationPermissionManager) {
        guard let location = manager.coordinates else { return }
        self.userLocation = Viewport.camera(center: location,
                                    zoom: 15,
                                    bearing: 0,
                                    pitch: 0)
    }
    
    private func initializeTabs() {
        let tabs: [WCTopBarItem] = [
            .init(iconName: "",
                  title: L10n.CamerAvailabilityViewModel.Tabs.availability,
                  destination: AvailabilityTabRoute(isPresented: .constant(false)).build()),
            .init(iconName: "",
                  title: L10n.CamerAvailabilityViewModel.Tabs.preferredArea,
                  destination: MapTabRoute(isPresented: .constant(false)).build())
        ]
        tabBarItems = tabs
        tabSelection = tabs[0]
    }
}
