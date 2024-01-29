import SwiftUI

final class ProfileViewModel: ProfileViewModelProtocol {

    // MARK: - Dependencies
    @Published var isEditingModeEnabled: Bool = false
    @Published var userData: UserData = .init()
    @Published var temporaryName: String = ""
    @Published var temporaryLastname: String = ""
    @Published var temporaryBirthDate: String = ""

    private let interactor: ProfileInteractorProtocol
    let userSession: UserSessionProtocol

    // MARK: - Initialization

    init(interactor: ProfileInteractorProtocol,
         userSession: UserSessionProtocol = UserSession()) {
        self.interactor = interactor
        self.userSession = userSession
        Task {
            await fetchUserData()
        }
    }

    // MARK: - Public API

    func logout() {
        try? userSession.clear()
    }

    // MARK: - Private Functions

    // swiftlint:disable line_length
    @MainActor private func fetchUserData() async {
        let user = await interactor.fetchUserData()
        
        var name = user.name
        var lastName = user.lastName
        var birthDate = ""
        userData = .init(profileImage: .imageMock,
                         name: name,
                         lastName: lastName,
                         birthDate: birthDate,
                         isWalkCamer: false)
        temporaryName = name
        temporaryLastname = lastName
        temporaryBirthDate = birthDate

    }
}
// swiftlint:enable line_length
