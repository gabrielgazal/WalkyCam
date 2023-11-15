import Foundation
import SwiftUI

struct GalleryRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: GalleryAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: GalleryAssemblerProtocol = GalleryAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}