import Foundation
import SwiftUI

struct ServiceConfirmationRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ServiceConfirmationAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ServiceConfirmationAssemblerProtocol = ServiceConfirmationAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}