import SwiftUI
import SendbirdChatSDK

protocol ChatViewModelProtocol: ViewModelProtocol {
    var channels: [ChannelModel] { get set }

    func handleChatSelection(_ id: String) -> OpenChannel
}
