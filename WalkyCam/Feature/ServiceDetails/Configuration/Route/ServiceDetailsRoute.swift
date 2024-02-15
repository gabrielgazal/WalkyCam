import Foundation
import SwiftUI

struct ServiceDetailsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ServiceDetailsAssemblerProtocol
    let onCancelAction: (() -> Void)?

    init(isPresented: Binding<Bool>,
         assembler: ServiceDetailsAssemblerProtocol = ServiceDetailsAssembler(),
         onCancelAction: (() -> Void)?) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.onCancelAction = onCancelAction
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
