import Foundation
import SwiftUI
import Networking

struct VideocallOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: VideocallOnboardingAssemblerProtocol
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: VideocallOnboardingAssemblerProtocol = VideocallOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
