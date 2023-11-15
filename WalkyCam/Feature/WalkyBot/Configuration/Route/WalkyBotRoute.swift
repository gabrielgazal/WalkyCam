import Foundation
import SwiftUI

struct WalkyBotRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: WalkyBotAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: WalkyBotAssemblerProtocol = WalkyBotAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}