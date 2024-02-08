import SwiftUI

protocol WalkyCamerOnboardingViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    func updateUserConfiguration(completion: (() -> Void)?) async
}
