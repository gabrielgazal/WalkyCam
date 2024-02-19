import Foundation
import SwiftUI

struct DroneMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: DroneMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: DroneMenuAssemblerProtocol = DroneMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}