import Foundation
import SwiftUI

struct DroneConnectionRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: DroneConnectionAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: DroneConnectionAssemblerProtocol = DroneConnectionAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}