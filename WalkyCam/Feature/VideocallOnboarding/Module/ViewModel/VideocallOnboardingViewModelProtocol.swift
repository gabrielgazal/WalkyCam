import SwiftUI

protocol VideocallOnboardingViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    var isUpdating: Bool { get set }
    func updateUserConfiguration(completion: (() -> Void)?) async
}
