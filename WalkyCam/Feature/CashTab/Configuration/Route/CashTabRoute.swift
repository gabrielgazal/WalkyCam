import Foundation
import SwiftUI

struct CashTabRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: CashTabAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: CashTabAssemblerProtocol = CashTabAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}