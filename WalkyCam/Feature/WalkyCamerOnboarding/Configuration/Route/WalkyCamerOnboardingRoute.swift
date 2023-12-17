import Foundation
import SwiftUI

struct WalkyCamerOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: WalkyCamerOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: WalkyCamerOnboardingAssemblerProtocol = WalkyCamerOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}