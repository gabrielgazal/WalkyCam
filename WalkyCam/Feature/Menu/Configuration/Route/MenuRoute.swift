import Foundation
import SwiftUI

struct MenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: MenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: MenuAssemblerProtocol = MenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}