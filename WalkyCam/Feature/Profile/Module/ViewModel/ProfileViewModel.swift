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
        userData = .init(profileImage: "https://imagens.brasil.elpais.com/resizer/m_SQSURoHDBKhE8wvUIlQBpuvdc=/1200x0/arc-anglerfish-eu-central-1-prod-prisa.s3.amazonaws.com/public/6TE7TL7D4YWZFV2TFRSGNGN6JE.jpg",
                         name: name,
                         lastName: lastName,
                         birthDate: birthDate,
                         isWalkCamer: false)
        temporaryName = name
        temporaryLastname = lastName
        temporaryBirthDate = birthDate

    }
}
