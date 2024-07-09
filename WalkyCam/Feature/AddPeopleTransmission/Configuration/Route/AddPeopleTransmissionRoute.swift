import Foundation
import SwiftUI

struct AddPeopleTransmissionRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: AddPeopleTransmissionAssemblerProtocol
    let currentStep: Int
    let totalSteps: Int
    
    init(isPresented: Binding<Bool>,
         currentStep: Int,
         totalSteps: Int,
         assembler: AddPeopleTransmissionAssemblerProtocol = AddPeopleTransmissionAssembler()) {
        self.isPresented = isPresented
        self.currentStep = currentStep
        self.totalSteps = totalSteps
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
