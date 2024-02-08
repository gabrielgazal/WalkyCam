import Foundation
import SwiftUI

struct ChatRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ChatAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ChatAssemblerProtocol = ChatAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}