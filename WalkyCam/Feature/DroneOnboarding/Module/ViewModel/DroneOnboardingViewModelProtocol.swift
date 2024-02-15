import SwiftUI

protocol DroneOnboardingViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    func updateUserConfiguration(completion: (() -> Void)?) async
}
