import SwiftUI
import SendbirdChatSDK

protocol ChatDetailsViewModelProtocol: ViewModelProtocol {
    var channel: OpenChannel { get set }
    var messages: [MessageModel] { get set }
}
