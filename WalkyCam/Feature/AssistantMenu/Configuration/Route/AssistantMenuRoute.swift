import Foundation
import SwiftUI

struct AssistantMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: AssistantMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: AssistantMenuAssemblerProtocol = AssistantMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}