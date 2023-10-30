import Foundation
import SwiftUI

struct ConfirmMailRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ConfirmMailAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ConfirmMailAssemblerProtocol = ConfirmMailAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}