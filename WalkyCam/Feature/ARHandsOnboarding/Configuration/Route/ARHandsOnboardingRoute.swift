import Foundation
import SwiftUI
import Networking

struct ARHandsOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ARHandsOnboardingAssemblerProtocol
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: ARHandsOnboardingAssemblerProtocol = ARHandsOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
