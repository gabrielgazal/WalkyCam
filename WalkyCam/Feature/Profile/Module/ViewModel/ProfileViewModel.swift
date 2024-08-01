import SwiftUI

final class ProfileViewModel: ProfileViewModelProtocol {

    // MARK: - Dependencies
    @Published var isEditingModeEnabled: Bool = false
    @Published var userData: UserData = .init()
    @Published var temporaryName: String = ""
    @Published var temporaryLastname: String = ""
    @Published var temporaryBirthDate: String = ""
    @Published var temporaryPhoneNumber: String = ""
    @Published var temporaryGender: String = ""
    @Published var temporaryAddress: String = ""
    @Published var temporaryAdditionalInfo: String = ""

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
        
        let name = user.name
        let lastName = user.lastName
        let birthDate = user.birthDate
        let planName = user.plan.name
        let phoneNumber = user.phone
        let gender = user.gender
        let address = user.address
        let additionalInfo = user.additionalInfo
        
        userData = .init(
            profileImage: .imageMock,
            name: name,
            lastName: lastName,
            phoneNumber: phoneNumber,
            birthDate: birthDate,
            gender: gender,
            address: address,
            additionalInfo: additionalInfo,
            email: user.email,
            userName: user.userName,
            isWalkCamer: user.isWalkCamer,
            planName: user.plan.name
        )
        temporaryName = name
        temporaryLastname = lastName
        temporaryBirthDate = birthDate
        temporaryPhoneNumber = phoneNumber
        temporaryGender = gender
        temporaryAddress = address
        temporaryAdditionalInfo = additionalInfo
    }
}
// swiftlint:enable line_length
