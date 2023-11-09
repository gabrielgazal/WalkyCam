import Foundation
import SwiftUI

struct CryptoTabRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: CryptoTabAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: CryptoTabAssemblerProtocol = CryptoTabAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}