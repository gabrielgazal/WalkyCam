import Foundation
import SwiftUI

struct AvailabilityTabRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: AvailabilityTabAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: AvailabilityTabAssemblerProtocol = AvailabilityTabAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}