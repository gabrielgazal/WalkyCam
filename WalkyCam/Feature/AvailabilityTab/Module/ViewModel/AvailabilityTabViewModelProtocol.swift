import SwiftUI

protocol AvailabilityTabViewModelProtocol: ViewModelProtocol {
    var availableOptions: [AvailabilityTabModel] { get set }
    
    func saveData()
}
