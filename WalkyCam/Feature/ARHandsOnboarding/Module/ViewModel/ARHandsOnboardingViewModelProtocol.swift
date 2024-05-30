import SwiftUI

protocol ARHandsOnboardingViewModelProtocol: ViewModelProtocol {
    var isUpdating: Bool { get set }

    func updateUserConfiguration(completion: (() -> Void)?) async
}
