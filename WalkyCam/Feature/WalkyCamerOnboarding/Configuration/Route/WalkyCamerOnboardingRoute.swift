import Foundation
import SwiftUI
import Networking

struct WalkyCamerOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: WalkyCamerOnboardingAssemblerProtocol
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: WalkyCamerOnboardingAssemblerProtocol = WalkyCamerOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
