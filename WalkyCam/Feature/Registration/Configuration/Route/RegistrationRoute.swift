import Foundation
import SwiftUI

struct RegistrationRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: RegistrationAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: RegistrationAssemblerProtocol = RegistrationAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}