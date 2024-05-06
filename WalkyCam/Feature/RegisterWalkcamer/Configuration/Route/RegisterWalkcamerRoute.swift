import Foundation
import SwiftUI

struct RegisterWalkcamerRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: RegisterWalkcamerAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: RegisterWalkcamerAssemblerProtocol = RegisterWalkcamerAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}