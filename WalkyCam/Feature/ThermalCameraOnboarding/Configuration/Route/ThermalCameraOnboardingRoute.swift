import Foundation
import SwiftUI

struct ThermalCameraOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ThermalCameraOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ThermalCameraOnboardingAssemblerProtocol = ThermalCameraOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}