import SwiftUI

final class FeatureInformationViewModel: FeatureInformationViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: FeatureInformationInteractorProtocol

    // MARK: - Initialization

    init(interactor: FeatureInformationInteractorProtocol = FeatureInformationInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    #warning("Example function. Rename or remove it")
    func someAction() {

    }

    // MARK: - Private Methods

    #warning("Example function. Rename or remove it")
    private func somePrivateMethod() {

    }
}
