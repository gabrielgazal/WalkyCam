import Foundation
import SwiftUI

struct AIOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: AIOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: AIOnboardingAssemblerProtocol = AIOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}