import Foundation
import SwiftUI

struct BulbPartyLightSelectorRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: BulbPartyLightSelectorAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: BulbPartyLightSelectorAssemblerProtocol = BulbPartyLightSelectorAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}