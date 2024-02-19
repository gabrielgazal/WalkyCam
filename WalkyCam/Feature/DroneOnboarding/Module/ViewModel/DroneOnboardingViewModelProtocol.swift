import SwiftUI

protocol DroneOnboardingViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    var acceptedTerms: SelectorModel { get set }
    func updateUserConfiguration(completion: (() -> Void)?) async
}
