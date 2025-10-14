import SwiftUI

final class LegalDocumentationViewModel: LegalDocumentationViewModelProtocol {

    // MARK: - Dependencies
    
    @Published var saveInfoAsyncData: AsyncData<Void, ErrorProtocol> = .idle
    @Published var toast: ToastModel? = nil
    @Published var showCompletionScreen: Bool = false
    
    private let interactor: LegalDocumentationInteractorProtocol
    private let router: LegalDocumentationRouterProtocol
    
    // MARK: - Initialization

    init(
        interactor: LegalDocumentationInteractorProtocol,
        router: LegalDocumentationRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }

    // MARK: - Public API

    func updateInfo() async {
        let data = WalkcamerRegistrationManager.shared.getData()
        saveInfoAsyncData = .loading
        Task {
            do {
                _ = try await interactor.updateUserData(data)
                saveInfoAsyncData = .loaded(())
                showCompletionScreen = true
            } catch {
                saveInfoAsyncData = .failed(GenericError())
                presentErrorToast()
            }
        }
    }
    
    private func presentErrorToast() {
        toast = ToastModel(
            style: .init(
                icon: Image(systemName: "xmark.circle.fill"),
                background: .rojo
            ),
            message: L10n.ProfileView.UpdateInfo.Error.Toast.title
        )
    }
}
