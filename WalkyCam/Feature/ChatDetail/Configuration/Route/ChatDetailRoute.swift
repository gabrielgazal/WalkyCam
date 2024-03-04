import Foundation
import SwiftUI

struct ChatDetailRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ChatDetailAssemblerProtocol
    let chatModel: ChannelModel

    init(isPresented: Binding<Bool>,
         assembler: ChatDetailAssemblerProtocol = ChatDetailAssembler(),
         chatModel: ChannelModel) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.chatModel = chatModel
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
