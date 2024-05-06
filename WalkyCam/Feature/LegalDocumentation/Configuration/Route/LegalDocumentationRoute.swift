import Foundation
import SwiftUI

struct LegalDocumentationRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: LegalDocumentationAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: LegalDocumentationAssemblerProtocol = LegalDocumentationAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}