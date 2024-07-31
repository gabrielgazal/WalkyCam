import SwiftUI
import MapKit
@_spi(Experimental) import MapboxMaps

protocol SearchWalkyCammerViewModelProtocol: ViewModelProtocol {
    var userLocation: Viewport { get set }
    var locationText: String { get set }
    var currentStep: Int { get set }
    var currentTitle: String { get set }
    var walkyCammers: AsyncData<[CammerData], ErrorProtocol> { get set }
    var shouldDisplayCammerList: Bool { get set }
    var cammerSearch: String { get set }
    
    func getUserRegion()
    func updateUserViewPort(manager: LocationPermissionManager)
    func isListButtonHidden() -> Bool
}
