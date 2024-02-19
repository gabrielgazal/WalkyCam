import Foundation
import SwiftUI

struct ARHandsMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ARHandsMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ARHandsMenuAssemblerProtocol = ARHandsMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}