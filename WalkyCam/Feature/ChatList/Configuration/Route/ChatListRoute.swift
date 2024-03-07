import Foundation
import SwiftUI

struct ChatListRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ChatListAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ChatListAssemblerProtocol = ChatListAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}