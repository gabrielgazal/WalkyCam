import Foundation
import SwiftUI

struct AppleWatchSimulatorRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: AppleWatchSimulatorAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: AppleWatchSimulatorAssemblerProtocol = AppleWatchSimulatorAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}