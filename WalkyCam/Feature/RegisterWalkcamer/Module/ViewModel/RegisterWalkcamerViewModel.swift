import SwiftUI

final class RegisterWalkcamerViewModel: RegisterWalkcamerViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: RegisterWalkcamerInteractorProtocol
    @Published var registrationData: CamerRegistrationData = .init()
    @Published var acceptedTerms: SelectorModel = .init(value: L10n.RegisterWalkcamerView.acceptedTerms)
    
    // MARK: - Initialization
    
    init(interactor: RegisterWalkcamerInteractorProtocol = RegisterWalkcamerInteractor()) {
        self.interactor = interactor
        self.retriveUserData()
    }
    
    // MARK: - Public API
    
    func isRegisterButtonDisabled() -> Bool {
        return registrationData.name.isEmpty || registrationData.lastName.isEmpty || registrationData.phoneNumber.isEmpty || registrationData.email.isEmpty || !acceptedTerms.isSelected
    }
    
    func saveUserDataToRegistration() {
        let manager = WalkcamerRegistrationManager.shared
        manager.updateUserInfo(
            id: registrationData.id,
            name: registrationData.name,
            lastName: registrationData.lastName,
            phoneNumber: registrationData.phoneNumber,
            email: registrationData.email
        )
    }
    
    private func retriveUserData() {
        let user = try? UserSession().user()
        self.registrationData = .init(
            id: user?.id ?? "",
            name: user?.name ?? "",
            lastName: user?.lastName ?? "",
            phoneNumber: user?.phone ?? "",
            email: user?.email ?? ""
        )
    }
}
