import Foundation
import SwiftUI

struct RuralDroneOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: RuralDroneOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: RuralDroneOnboardingAssemblerProtocol = RuralDroneOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
