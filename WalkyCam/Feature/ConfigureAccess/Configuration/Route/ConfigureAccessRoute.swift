import Foundation
import SwiftUI

struct ConfigureAccessRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ConfigureAccessAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ConfigureAccessAssemblerProtocol = ConfigureAccessAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}