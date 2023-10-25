import SwiftUI

final class ProfileViewModel: ProfileViewModelProtocol {

    // MARK: - Dependencies
    @Published var isEditingModeEnabled: Bool = false
    @Published var userData: UserData = .init()
    @Published var temporaryName: String = ""
    @Published var temporaryLastname: String = ""
    @Published var temporaryBirthDate: String = ""
    private let interactor: ProfileInteractorProtocol

    // MARK: - Initialization

    init(interactor: ProfileInteractorProtocol = ProfileInteractor()) {
        self.interactor = interactor
        fetchUserData()
    }

    // MARK: - Private Functions

    // swiftlint:disable line_length
    private func fetchUserData() {
        var name = "Teste"
        var lastName = "Teste"
        var birthDate = "20/04/1999"
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
