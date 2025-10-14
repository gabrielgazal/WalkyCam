import Foundation
import SwiftUI

struct UploadImageToPrintRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: UploadImageToPrintAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: UploadImageToPrintAssemblerProtocol = UploadImageToPrintAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}