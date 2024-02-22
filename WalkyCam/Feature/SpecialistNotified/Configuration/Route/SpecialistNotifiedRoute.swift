import Foundation
import SwiftUI

struct SpecialistNotifiedRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: SpecialistNotifiedAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: SpecialistNotifiedAssemblerProtocol = SpecialistNotifiedAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}