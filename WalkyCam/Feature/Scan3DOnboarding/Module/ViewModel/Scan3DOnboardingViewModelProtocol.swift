import SwiftUI

protocol Scan3DOnboardingViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    var isUpdating: Bool { get set }

    func updateUserConfiguration(completion: (() -> Void)?) async
}
