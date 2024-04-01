import Foundation
import SwiftUI

struct DigitalTwinsOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: DigitalTwinsOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: DigitalTwinsOnboardingAssemblerProtocol = DigitalTwinsOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}