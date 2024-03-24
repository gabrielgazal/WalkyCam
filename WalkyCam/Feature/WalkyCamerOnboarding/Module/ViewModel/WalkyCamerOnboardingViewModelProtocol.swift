import SwiftUI

protocol WalkyCamerOnboardingViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    var isUpdating: Bool { get set }

    func updateUserConfiguration(completion: (() -> Void)?) async
}
