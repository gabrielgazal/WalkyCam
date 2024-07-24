import SwiftUI
import CoreLocation

final class ServiceDetailsViewModel: ServiceDetailsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ServiceDetailsInteractorProtocol
    private let serviceManager: ServiceInformationManagerProtocol
    var onCancelAction: (() -> Void)?
    @Published var service: FunctionData = .init(title: "", icon: "")
    @Published var currentStep: Int
    @Published var totalSteps: Int
    
    // MARK: - Initialization

    init(interactor: ServiceDetailsInteractorProtocol = ServiceDetailsInteractor(),
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared,
         currentStep: Int,
         totalSteps: Int,
         onCancelAction: (() -> Void)? = nil) {
        self.interactor = interactor
        self.serviceManager = serviceManager
        self.currentStep = currentStep
        self.totalSteps = totalSteps
        self.onCancelAction = onCancelAction
        initializeService()
    }

    // MARK: - Public API

    func cancelAction() {
        onCancelAction?()
    }
    
    func assembleServiceDetails() -> [ServiceDetailsItemModel] {
        var dataToReturn: [ServiceDetailsItemModel] = []
        let basicInfo = serviceManager.getServiceBasicInformation()
        let cammerInfo = serviceManager.getServiceCammerInformation()
        
        dataToReturn.append(
            .init(title: "Día", value: formatDateToDay(basicInfo.date))
        )
        dataToReturn.append(
            .init(title: "Hora", value: formatDateToTime(basicInfo.date))
        )
        if let cammerName = cammerInfo?.name {
            dataToReturn.append(
                .init(title: "WalkCamer", value: cammerName)
            )
        }
        
        if let serviceCity = formatLocationToCity(basicInfo.location) {
            dataToReturn.append(
                .init(title: "Lugar de grabación", value: serviceCity)
            )
        }
        
        if let serviceCountry = formatLocationToCountry(basicInfo.location) {
            dataToReturn.append(
                .init(title: "País", value: serviceCountry)
            )
        }
        return dataToReturn
    }
    

    // MARK: - Private Methods
    
    private func formatLocationToCity(_ location: CLLocationCoordinate2D) -> String? {
        let location = CLLocation(latitude: location.latitude, longitude: location.longitude)
        
        let geocoder = CLGeocoder()
        
        var stringToReturn: String?
        
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "es_ES")) { (placemarks, error) in
            if let error = error {
                stringToReturn = nil
            } else if let placemarks = placemarks, let placemark = placemarks.first {
                let city = placemark.locality
                stringToReturn = city
            } else {
                stringToReturn = nil
            }
        }
        return stringToReturn
    }
    
    private func formatLocationToCountry(_ location: CLLocationCoordinate2D) -> String? {
        let location = CLLocation(latitude: location.latitude, longitude: location.longitude)
        
        let geocoder = CLGeocoder()
        
        var stringToReturn: String?
        
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "es_ES")) { (placemarks, error) in
            if let error = error {
                stringToReturn = nil
            } else if let placemarks = placemarks, let placemark = placemarks.first {
                let city = placemark.country
                stringToReturn = city
            } else {
                stringToReturn = nil
            }
        }
        return stringToReturn
    }
    
    private func formatDateToDay(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        dateFormatter.locale = Locale(identifier: "es_ES")
        return dateFormatter.string(from: date)
    }
    
    private func formatDateToTime(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm 'h'"
        timeFormatter.locale = Locale(identifier: "es_ES")
        return timeFormatter.string(from: date)
    }

    private func initializeService() {
        self.service = FunctionType(rawValue: UserDefaults.standard.string(forKey: "currentService") ?? "")?.convertedValue ?? .init(title: "", icon: "")
    }
}
