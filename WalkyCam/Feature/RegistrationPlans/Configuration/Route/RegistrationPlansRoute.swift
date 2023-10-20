import Foundation
import SwiftUI

struct RegistrationPlansRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: RegistrationPlansAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: RegistrationPlansAssemblerProtocol = RegistrationPlansAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}