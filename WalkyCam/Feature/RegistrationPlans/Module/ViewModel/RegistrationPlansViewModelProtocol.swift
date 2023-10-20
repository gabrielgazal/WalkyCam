import SwiftUI

protocol RegistrationPlansViewModelProtocol: ViewModelProtocol {
    var availablePlans: [AvailablePlanData] { get set }
}
