import MapKit

protocol MapTabInteractorProtocol {
    func getCammersOnLocation(location: CLLocationCoordinate2D) -> [CammerData]
}
