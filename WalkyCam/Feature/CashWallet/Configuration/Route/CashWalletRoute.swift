import Foundation
import SwiftUI

struct CashWalletRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: CashWalletAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: CashWalletAssemblerProtocol = CashWalletAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}