import Foundation
import SwiftUI

struct Video3DScannerRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: Video3DScannerAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: Video3DScannerAssemblerProtocol = Video3DScannerAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}