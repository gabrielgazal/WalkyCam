import Foundation
import SwiftUI

struct OnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: OnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: OnboardingAssemblerProtocol = OnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}