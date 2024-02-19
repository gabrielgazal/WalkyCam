import Foundation
import SwiftUI

struct WalkyCammerListRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: WalkyCammerListAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: WalkyCammerListAssemblerProtocol = WalkyCammerListAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}