import Foundation
import SwiftUI
import SendbirdChatSDK

struct ChatDetailsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ChatDetailsAssemblerProtocol
    var channel: OpenChannel

    init(isPresented: Binding<Bool>,
         assembler: ChatDetailsAssemblerProtocol = ChatDetailsAssembler(),
         channel: OpenChannel) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.channel = channel
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
