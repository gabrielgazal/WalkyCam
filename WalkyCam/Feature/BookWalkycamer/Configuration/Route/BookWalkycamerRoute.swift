import Foundation
import SwiftUI

struct BookWalkycamerRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: BookWalkycamerAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: BookWalkycamerAssemblerProtocol = BookWalkycamerAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}