import Foundation
import SwiftUI

struct HomeRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: HomeAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: HomeAssemblerProtocol = HomeAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}