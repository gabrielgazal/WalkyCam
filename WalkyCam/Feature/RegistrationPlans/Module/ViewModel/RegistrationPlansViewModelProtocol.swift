import SwiftUI

protocol RegistrationPlansViewModelProtocol: ViewModelProtocol {
    var availablePlans: AsyncData<[AvailablePlanData], ErrorProtocol> { get set }

    func fetchAvailablePlans() async
}
