import Foundation
import SwiftUI

struct AIMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: AIMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: AIMenuAssemblerProtocol = AIMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}