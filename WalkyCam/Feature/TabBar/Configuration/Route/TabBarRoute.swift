import Foundation
import SwiftUI

struct TabBarRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: TabBarAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: TabBarAssemblerProtocol = TabBarAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}