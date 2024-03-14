import SwiftUI

protocol WalkyBotViewModelProtocol: ViewModelProtocol {
    var messages: AsyncData<[MessageModel], ErrorProtocol> { get set }
    var currentMessage: String { get set }
    var messageObserver: MessageObserver { get set }
    
    func initializeUser()
    func sendMessage()
    func loadMessages()
    func loadNewTexts()
    func subscribeToChannelEvents()
}
