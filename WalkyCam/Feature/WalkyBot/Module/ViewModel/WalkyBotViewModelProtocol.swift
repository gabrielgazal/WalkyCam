import SwiftUI

protocol WalkyBotViewModelProtocol: ViewModelProtocol {
    var message: String { get set }
    var messages: [MessageModel] { get set }
    var users: [String:String] { get set }
    var newUser: String { get set }
    var showUsernamePrompt: Bool { get set }
    var isShowingNewUserAlert: Bool { get set }
    var userName: String { get set }
    var userID: String { get set }
    var asyncLoading: AsyncData<String, ErrorProtocol> { get set }
    
    func getUserChatId() async
}
