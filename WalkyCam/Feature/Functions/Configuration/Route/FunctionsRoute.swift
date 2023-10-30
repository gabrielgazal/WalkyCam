import Foundation
import SwiftUI

struct FunctionsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: FunctionsAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: FunctionsAssemblerProtocol = FunctionsAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}