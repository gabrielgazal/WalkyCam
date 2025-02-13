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
    @Published var asyncLoading: AsyncData<String, ErrorProtocol> = .idle
    
    // MARK: - Initialization

    init(interactor: WalkyBotInteractorProtocol) {
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
    
    @MainActor func getUserChatId() async {
        do {
            let chatbotId = try await interactor.getUserChatId(userId: userID)
            
        } catch {}
    }
}
