import Foundation
import SwiftUI

struct ServiceDetailsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ServiceDetailsAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ServiceDetailsAssemblerProtocol = ServiceDetailsAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}