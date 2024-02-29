import Foundation
import SwiftUI

struct _DPrintOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: _DPrintOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: _DPrintOnboardingAssemblerProtocol = _DPrintOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}