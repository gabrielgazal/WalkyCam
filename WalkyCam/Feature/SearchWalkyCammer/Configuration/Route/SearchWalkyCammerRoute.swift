import Foundation
import SwiftUI

struct SearchWalkyCammerRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: SearchWalkyCammerAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: SearchWalkyCammerAssemblerProtocol = SearchWalkyCammerAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}