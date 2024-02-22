import Foundation
import SwiftUI

struct Scan3DOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: Scan3DOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: Scan3DOnboardingAssemblerProtocol = Scan3DOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}