import Foundation
import SwiftUI

struct PrintConfirmationRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: PrintConfirmationAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: PrintConfirmationAssemblerProtocol = PrintConfirmationAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}