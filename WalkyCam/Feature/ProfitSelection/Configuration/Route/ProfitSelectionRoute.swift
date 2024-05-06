import Foundation
import SwiftUI

struct ProfitSelectionRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ProfitSelectionAssemblerProtocol
    let registrationData: CamerRegistrationData

    init(isPresented: Binding<Bool>,
         registrationData: CamerRegistrationData,
         assembler: ProfitSelectionAssemblerProtocol = ProfitSelectionAssembler()) {
        self.isPresented = isPresented
        self.registrationData = registrationData
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
