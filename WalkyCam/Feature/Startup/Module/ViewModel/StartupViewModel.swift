import SwiftUI

final class StartupViewModel: StartupViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: StartupInteractorProtocol
    @Published var userName: String = ""
    
    // MARK: - Initialization

    init(interactor: StartupInteractorProtocol = StartupInteractor()) {
        self.interactor = interactor
        self.getUserName()
    }

    // MARK: - Private Methods

    private func getUserName() {
        let name = try? UserSession().user().name
        guard let name = name,
              !name.isEmpty else { return }
        userName = name
    }
}
