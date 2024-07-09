import Foundation
import SwiftUI

struct ServiceDetailsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ServiceDetailsAssemblerProtocol
    let onCancelAction: (() -> Void)?
    let currentStep: Int
    let totalSteps: Int
    
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
