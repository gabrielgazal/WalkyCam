import Foundation
import SwiftUI

struct AddPeopleTransmissionRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: AddPeopleTransmissionAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: AddPeopleTransmissionAssemblerProtocol = AddPeopleTransmissionAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}