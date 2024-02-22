import SwiftUI

final class AssistantMenuViewModel: AssistantMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AssistantMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: AssistantMenuInteractorProtocol = AssistantMenuInteractor()) {
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
