import SwiftUI
import CoreLocation

final class CammerDetailsViewModel: CammerDetailsViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: CammerDetailsInteractorProtocol
    private let serviceManager: ServiceInformationManagerProtocol
    @Published var cammerData: CammerData
    @Published var topBarItems: [WCTopBarItem] = [
        .init(iconName: "", title: L10n.CammerDetailsViewModel.TopBarItem.information),
//        .init(iconName: "", title: L10n.CammerDetailsViewModel.TopBarItem.reviews)
    ]
    @Published var selection: WCTopBarItem = .init(iconName: "", title: L10n.CammerDetailsViewModel.TopBarItem.information)
    @Published var specialistMode: Bool
    @Published var locationName: String = ""
    
    // MARK: - Initialization
    
    init(interactor: CammerDetailsInteractorProtocol,
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared,
         cammerData: CammerData,
         specialistMode: Bool) {
        self.interactor = interactor
        self.serviceManager = serviceManager
        self.cammerData = cammerData
        self.specialistMode = specialistMode
        getCammerLocation()
    }
    
    // MARK: - Public API
    
    func updateSelectedCammer() {
        serviceManager.updateCammerInformation(cammerData)
    }
    
    func getCammerLocation() {
        let location = CLLocation(
            latitude: cammerData.coordinates.latitude,
            longitude: cammerData.coordinates.longitude
        )
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: L10n.Formater.locale)) { (placemarks, error) in
            if let placemarks = placemarks, 
                let placemark = placemarks.first,
               let name = placemark.name {
                self.locationName = name
            }
        }
    }
}
