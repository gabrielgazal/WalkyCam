import SwiftUI
import MapKit

protocol AvailableAssistantsViewModelProtocol: ViewModelProtocol {
    var walkyCammers: AsyncData<[CammerData], ErrorProtocol> { get set }
    
    func getWalkyCammers(location: CLLocationCoordinate2D)
    func getUserRegion()
}
