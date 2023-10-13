import Foundation
import SwiftUI

struct LoginRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: LoginAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: LoginAssemblerProtocol = LoginAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
