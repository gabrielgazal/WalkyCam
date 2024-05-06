import SwiftUI
import MapKit
@_spi(Experimental) import MapboxMaps

protocol CamerAvailabilityViewModelProtocol: ViewModelProtocol {
    var userLocation: Viewport { get set }
    var locationText: String { get set }
    var walkyCammers: AsyncData<[CammerData], ErrorProtocol> { get set }
    var shouldDisplayTimes: Bool { get set }
    var tabSelection: WCTopBarItem { get set }
    var tabBarItems: [WCTopBarItem] { get set }

    func getUserRegion()
    func updateUserViewPort(manager: LocationPermissionManager)
}
