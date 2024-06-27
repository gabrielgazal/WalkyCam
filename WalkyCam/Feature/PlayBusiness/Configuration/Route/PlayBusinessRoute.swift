import Foundation
import SwiftUI

struct PlayBusinessRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: PlayBusinessAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: PlayBusinessAssemblerProtocol = PlayBusinessAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}