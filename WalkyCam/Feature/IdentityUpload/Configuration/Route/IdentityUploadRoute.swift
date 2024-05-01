import Foundation
import SwiftUI

struct IdentityUploadRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: IdentityUploadAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: IdentityUploadAssemblerProtocol = IdentityUploadAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}