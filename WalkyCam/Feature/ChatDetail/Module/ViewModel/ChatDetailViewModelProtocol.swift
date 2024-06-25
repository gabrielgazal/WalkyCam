import SwiftUI

protocol ChatDetailViewModelProtocol: ViewModelProtocol {
    var chatModel: ChannelModel { get set }
    var messages: AsyncData<[MessageModel], ErrorProtocol> { get set }
    var currentMessage: String { get set }
    var messageObserver: MessageObserver { get set }

    func sendMessage()
    func loadMessages()
    func loadNewTexts()
    func subscribeToChannelEvents()
}
