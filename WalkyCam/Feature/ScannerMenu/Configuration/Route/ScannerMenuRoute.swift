import Foundation
import SwiftUI

struct ScannerMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ScannerMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ScannerMenuAssemblerProtocol = ScannerMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}