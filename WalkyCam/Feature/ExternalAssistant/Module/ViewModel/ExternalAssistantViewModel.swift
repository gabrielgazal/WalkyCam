import SwiftUI

final class ExternalAssistantViewModel: ExternalAssistantViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ExternalAssistantInteractorProtocol
    @Published var assistantCode: String = ""

    // MARK: - Initialization

    init(interactor: ExternalAssistantInteractorProtocol = ExternalAssistantInteractor()) {
        self.interactor = interactor
    }
}
