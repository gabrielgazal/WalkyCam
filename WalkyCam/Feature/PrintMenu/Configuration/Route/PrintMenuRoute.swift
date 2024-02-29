import Foundation
import SwiftUI

struct PrintMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: PrintMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: PrintMenuAssemblerProtocol = PrintMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}