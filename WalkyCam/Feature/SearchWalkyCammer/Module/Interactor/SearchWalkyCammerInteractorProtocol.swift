import MapKit

protocol SearchWalkyCammerInteractorProtocol {
    func getCammersOnLocation(location: CLLocationCoordinate2D) async throws -> [CammerData]
}
