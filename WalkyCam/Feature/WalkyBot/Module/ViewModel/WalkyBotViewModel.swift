import SwiftUI

final class WalkyBotViewModel: WalkyBotViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: WalkyBotInteractorProtocol
    @Published var message: String = ""
    @Published var messages: [MessageModel] = []
    @Published var users: [String:String] = [:]
    @Published var newUser: String = ""
    @Published var showUsernamePrompt: Bool = true
    @Published var isShowingNewUserAlert = false
    @Published var userName: String = ""
    @Published var userID: String = ""
    
    // MARK: - Initialization

    init(interactor: WalkyBotInteractorProtocol = WalkyBotInteractor()) {
        self.interactor = interactor
        getUserCredentials()
    }

    // MARK: - Public API

    func getUserCredentials() {
        if let username = try? UserSession().user().userName,
           let userId = try? UserSession().user().id {
            userName = username
            userID = userId
        } else {
            // error
            userName = "developer"
            userID = "developer"
        }
    }
}
