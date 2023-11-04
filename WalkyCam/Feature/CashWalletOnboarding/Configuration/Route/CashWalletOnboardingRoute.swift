import Foundation
import SwiftUI

struct CashWalletOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: CashWalletOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: CashWalletOnboardingAssemblerProtocol = CashWalletOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}