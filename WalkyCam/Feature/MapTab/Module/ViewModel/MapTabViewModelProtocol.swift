import SwiftUI
@_spi(Experimental) import MapboxMaps

protocol MapTabViewModelProtocol: ViewModelProtocol {
    var locationText: String { get set }
    var mapView: MapView? { get set }
    
    func getUserRegion()
    func updateUserViewPort(manager: LocationPermissionManager)
    func updateUserRegionGeocoder()
    func panCameraToLocation()
}
