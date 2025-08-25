import Foundation
import SwiftUI

struct ShopTabRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ShopTabAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ShopTabAssemblerProtocol = ShopTabAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}