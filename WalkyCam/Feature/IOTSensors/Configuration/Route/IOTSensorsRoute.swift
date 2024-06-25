import Foundation
import SwiftUI

struct IOTSensorsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: IOTSensorsAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: IOTSensorsAssemblerProtocol = IOTSensorsAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}