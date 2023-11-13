import Foundation
import SwiftUI

struct CryptoDetailsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: CryptoDetailsAssemblerProtocol
    let cryptoData: CryptoActivityModel

    init(isPresented: Binding<Bool>,
         assembler: CryptoDetailsAssemblerProtocol = CryptoDetailsAssembler(),
         cryptoData: CryptoActivityModel) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.cryptoData = cryptoData
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
