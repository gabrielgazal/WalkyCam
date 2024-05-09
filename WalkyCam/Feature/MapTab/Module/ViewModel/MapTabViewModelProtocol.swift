import SwiftUI
@_spi(Experimental) import MapboxMaps

protocol MapTabViewModelProtocol: ViewModelProtocol {
    var userLocation: Viewport { get set }
    var locationText: String { get set }

    func getUserRegion()
    func updateUserViewPort(manager: LocationPermissionManager)
}
