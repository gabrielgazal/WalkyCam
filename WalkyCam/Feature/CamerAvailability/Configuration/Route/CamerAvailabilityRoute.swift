import Foundation
import SwiftUI

struct CamerAvailabilityRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: CamerAvailabilityAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: CamerAvailabilityAssemblerProtocol = CamerAvailabilityAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}