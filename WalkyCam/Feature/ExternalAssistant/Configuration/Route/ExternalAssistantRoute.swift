import Foundation
import SwiftUI

struct ExternalAssistantRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ExternalAssistantAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ExternalAssistantAssemblerProtocol = ExternalAssistantAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}