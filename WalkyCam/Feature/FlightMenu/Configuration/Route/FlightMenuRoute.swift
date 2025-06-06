import Foundation
import SwiftUI

struct FlightMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: FlightMenuAssemblerProtocol
    let menuMode: FlightMenuMode

    init(isPresented: Binding<Bool>,
         assembler: FlightMenuAssemblerProtocol = FlightMenuAssembler(),
         menuMode: FlightMenuMode) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.menuMode = menuMode
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
