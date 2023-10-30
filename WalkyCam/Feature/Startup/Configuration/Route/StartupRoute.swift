import Foundation
import SwiftUI

struct StartupRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: StartupAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: StartupAssemblerProtocol = StartupAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}