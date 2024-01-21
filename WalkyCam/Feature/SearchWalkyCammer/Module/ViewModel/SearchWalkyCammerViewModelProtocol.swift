import SwiftUI
import MapKit

protocol SearchWalkyCammerViewModelProtocol: ViewModelProtocol {
    var userLocation: AsyncData<CLLocationCoordinate2D, ErrorProtocol> { get set }
    func getUserRegion()
}
