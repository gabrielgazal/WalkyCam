import MapKit

protocol SearchWalkyCammerInteractorProtocol {
    func getCammersOnLocation(location: CLLocationCoordinate2D) -> [CammerData] 
}
