import SwiftUI
import MapKit

protocol SearchWalkyCammerViewModelProtocol: ViewModelProtocol {
    var userLocation: AsyncData<CLLocationCoordinate2D, ErrorProtocol> { get set }
    var locationText: String { get set }
    func getUserRegion()
}
