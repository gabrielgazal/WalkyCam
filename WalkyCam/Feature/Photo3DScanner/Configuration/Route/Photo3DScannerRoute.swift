import Foundation
import SwiftUI

struct Photo3DScannerRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: Photo3DScannerAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: Photo3DScannerAssemblerProtocol = Photo3DScannerAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}