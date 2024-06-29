import Foundation
import SwiftUI

struct GamesRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: GamesAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: GamesAssemblerProtocol = GamesAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}