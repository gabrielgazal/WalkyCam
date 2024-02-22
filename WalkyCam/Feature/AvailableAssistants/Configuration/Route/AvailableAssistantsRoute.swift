import Foundation
import SwiftUI

struct AvailableAssistantsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: AvailableAssistantsAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: AvailableAssistantsAssemblerProtocol = AvailableAssistantsAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}