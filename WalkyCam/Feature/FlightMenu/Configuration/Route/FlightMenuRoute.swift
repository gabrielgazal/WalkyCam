import Foundation
import SwiftUI

struct FlightMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: FlightMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: FlightMenuAssemblerProtocol = FlightMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}