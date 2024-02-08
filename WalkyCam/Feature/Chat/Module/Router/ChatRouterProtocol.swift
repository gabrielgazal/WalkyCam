import SwiftUI
import SendbirdChatSDK

protocol ChatRouterProtocol: Router {
    func routeToChatDetails(channel: OpenChannel)
}

