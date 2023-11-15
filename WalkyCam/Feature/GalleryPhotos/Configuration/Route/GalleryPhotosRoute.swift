import Foundation
import SwiftUI

struct GalleryPhotosRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: GalleryPhotosAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: GalleryPhotosAssemblerProtocol = GalleryPhotosAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}