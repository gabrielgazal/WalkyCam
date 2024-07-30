import Foundation
import SwiftUI
import Networking

struct ServiceDetailsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ServiceDetailsAssemblerProtocol
    let onCancelAction: (() -> Void)?
    let currentStep: Int
    let totalSteps: Int
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         currentStep: Int,
         totalSteps: Int,
         assembler: ServiceDetailsAssemblerProtocol = ServiceDetailsAssembler(),
         onCancelAction: (() -> Void)?) {
        self.isPresented = isPresented
        self.currentStep = currentStep
        self.totalSteps = totalSteps
        self.assembler = assembler
        self.onCancelAction = onCancelAction
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
