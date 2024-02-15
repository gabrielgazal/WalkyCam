import Foundation
import SwiftUI

struct DroneOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: DroneOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: DroneOnboardingAssemblerProtocol = DroneOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}