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
    @Published var detailItems: [ServiceDetailsItemModel] = []
    @Published var devices: [DevicesInfo] = []
    @Published var abilities: [AbilityInfo] = []
    @Published var updateCallAsyncData: AsyncData<String, ErrorProtocol> = .idle
    @Published var cancelCallAsyncData: AsyncData<String, ErrorProtocol> = .idle
    @Published var pixelationActive: Bool = false
    
    // MARK: - Initialization

    init(interactor: ServiceDetailsInteractorProtocol,
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
        assembleServiceDetails()
    }

    // MARK: - Public API

    func cancelAction() {
        onCancelAction?()
    }
    
    func assembleServiceDetails() {
        let basicInfo = serviceManager.getServiceBasicInformation()
        let cammerInfo = serviceManager.getServiceCammerInformation()
        
        detailItems.append(
            .init(title: "Día", value: formatDateToDay(basicInfo.date))
        )
        detailItems.append(
            .init(title: "Hora", value: formatDateToTime(basicInfo.date))
        )
        if let cammerName = cammerInfo?.name {
            detailItems.append(
                .init(title: "WalkCamer", value: cammerName, image: cammerInfo?.profileImage)
            )
        }
        
        formatLocationToPlaceName(from: basicInfo.location) { name in
            if let servicePlaceName = name {
                self.detailItems.append(
                    .init(title: "Lugar de grabación", value: servicePlaceName)
                )
            }
        }
        
        formatLocationToCity(from: basicInfo.location) { city in
            if let serviceCity = city {
                self.detailItems.append(
                    .init(title: "Ciudad", value: serviceCity)
                )
            }
        }

        formatLocationToCountry(from: basicInfo.location) { country in
            if let serviceCountry = country {
                self.detailItems.append(
                    .init(title: "País", value: serviceCountry)
                )
            }
        }
        
        devices = cammerInfo?.devices ?? []
        abilities = cammerInfo?.abilities ?? []
    }
    
    @MainActor func updateVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
         updateCallAsyncData = .loading
        do {
            let output = try await interactor.updateVideoCall(assembleUpdateInput())
            onSuccess?()
            updateCallAsyncData = .loaded(output)
        } catch {
            onFailure?()
            updateCallAsyncData = .failed(GenericError())
        }
    }
    
    @MainActor func cancelVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
         cancelCallAsyncData = .loading
        do {
            _ = try await interactor.cancelVideoCall()
            cancelCallAsyncData = .loaded("")
            onSuccess?()
        } catch {
            onFailure?()
            cancelCallAsyncData = .failed(GenericError())
        }
    }
    
    // MARK: - Private Methods
    
    func formatLocationToPlaceName(from coordinates: CLLocationCoordinate2D, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "es_ES")) { (placemarks, error) in
            if let error = error {
                completion(nil)
            } else if let placemarks = placemarks, let placemark = placemarks.first {
                let name = placemark.name
                completion(name)
            } else {
                completion(nil)
            }
        }
    }
    
    func formatLocationToCity(from coordinates: CLLocationCoordinate2D, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "es_ES")) { (placemarks, error) in
            if let error = error {
                completion(nil)
            } else if let placemarks = placemarks, let placemark = placemarks.first {
                let city = placemark.locality
                completion(city)
            } else {
                completion(nil)
            }
        }
    }
    
    func formatLocationToCountry(from coordinates: CLLocationCoordinate2D, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "es_ES")) { (placemarks, error) in
            if let error = error {
                completion(nil)
            } else if let placemarks = placemarks, let placemark = placemarks.first {
                let city = placemark.country
                completion(city)
            } else {
                completion(nil)
            }
        }
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
    
    private func assembleUpdateInput() -> UpdateVideoCallInput {
        let service = serviceManager.getServiceBasicInformation()
        return .init(
            callId: service.callId,
            date: formatDate(service.date),
            startTime: formatTime(service.date),
            endTime: formatTime(service.endDate),
            pixelationEnabled: pixelationActive
        )
    }
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: date)
    }
    
    func formatTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
