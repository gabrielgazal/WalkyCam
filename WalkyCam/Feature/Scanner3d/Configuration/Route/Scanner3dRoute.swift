import Foundation
import SwiftUI

struct Scanner3dRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: Scanner3dAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: Scanner3dAssemblerProtocol = Scanner3dAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}