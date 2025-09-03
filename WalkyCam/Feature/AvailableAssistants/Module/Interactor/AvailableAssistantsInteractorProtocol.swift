import CoreLocation

protocol AvailableAssistantsInteractorProtocol {
    func getCammersOnLocation(location: CLLocationCoordinate2D) async throws -> [CammerData]
}
