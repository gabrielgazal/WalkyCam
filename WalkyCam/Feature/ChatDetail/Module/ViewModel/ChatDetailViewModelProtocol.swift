import SwiftUI

protocol ChatDetailViewModelProtocol: ViewModelProtocol {
    var chatModel: ChannelModel { get set }
    var messages: AsyncData<[MessageModel], ErrorProtocol> { get set }
    var currentMessage: String { get set }

    func sendMessage()
}
