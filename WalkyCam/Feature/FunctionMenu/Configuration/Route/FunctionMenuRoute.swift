import Foundation
import SwiftUI

struct FunctionMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: FunctionMenuAssemblerProtocol
    let model: FunctionMenuModel

    init(isPresented: Binding<Bool>,
         assembler: FunctionMenuAssemblerProtocol = FunctionMenuAssembler(),
         model: FunctionMenuModel) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.model = model
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
