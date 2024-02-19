import Foundation
import SwiftUI

struct ARHandsOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ARHandsOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ARHandsOnboardingAssemblerProtocol = ARHandsOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}