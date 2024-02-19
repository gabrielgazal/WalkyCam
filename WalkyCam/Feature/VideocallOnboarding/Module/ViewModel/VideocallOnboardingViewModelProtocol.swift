import SwiftUI

protocol VideocallOnboardingViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    func updateUserConfiguration(completion: (() -> Void)?) async
}
