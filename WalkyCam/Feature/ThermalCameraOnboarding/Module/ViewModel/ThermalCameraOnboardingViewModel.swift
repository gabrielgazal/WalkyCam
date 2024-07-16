import SwiftUI

final class ThermalCameraOnboardingViewModel: ThermalCameraOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ThermalCameraOnboardingInteractorProtocol
    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init(interactor: ThermalCameraOnboardingInteractorProtocol = ThermalCameraOnboardingInteractor()) {
        self.interactor = interactor
    }
}
