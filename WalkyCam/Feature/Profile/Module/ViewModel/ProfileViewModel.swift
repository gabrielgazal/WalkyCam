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
    @Published var asyncProfileInfo: AsyncData<String, ErrorProtocol> = .idle
    @Published var toast: ToastModel? = nil
    
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
    
    @MainActor func updateInfo() async {
        asyncProfileInfo = .loading
        Task {
            do {
                let output = try await interactor.updateUserData(
                    .init(
                        id: userData.id,
                        profileImage: userData.profileImage,
                        name: temporaryName,
                        lastName: temporaryLastname,
                        phoneNumber: temporaryPhoneNumber,
                        birthDate: temporaryBirthDate,
                        gender: temporaryGender,
                        address: temporaryAddress,
                        additionalInfo: temporaryAdditionalInfo,
                        email: userData.email,
                        userName: userData.userName,
                        isWalkCamer: userData.isWalkCamer,
                        planName: userData.planName
                    )
                )
                asyncProfileInfo = .loaded("")
                userData = output
                isEditingModeEnabled = false
                presentSuccessToast()
            } catch {
                asyncProfileInfo = .failed(GenericError())
                isEditingModeEnabled = false
                presentErrorToast()
            }
        }
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
            id: user.id,
            profileImage: user.profileImageURL ?? "",
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
    
    private func presentSuccessToast() {
        toast = ToastModel(
            style: .init(
                icon: Image(systemName: "checkmark.circle.fill"),
                background: .premium
            ),
            message: L10n.ProfileView.UpdateInfo.Success.Toast.title
        )
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
// swiftlint:enable line_length
