import Foundation
import SwiftUI

struct IOTOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: IOTOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: IOTOnboardingAssemblerProtocol = IOTOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}