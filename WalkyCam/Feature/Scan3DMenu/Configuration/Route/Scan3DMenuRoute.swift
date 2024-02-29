import Foundation
import SwiftUI

struct Scan3DMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: Scan3DMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: Scan3DMenuAssemblerProtocol = Scan3DMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}