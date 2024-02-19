import Foundation
import SwiftUI

struct MapTabRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: MapTabAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: MapTabAssemblerProtocol = MapTabAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}