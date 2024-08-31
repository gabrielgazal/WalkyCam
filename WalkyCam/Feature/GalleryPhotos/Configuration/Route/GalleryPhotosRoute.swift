import Foundation
import SwiftUI

struct GalleryPhotosRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: GalleryPhotosAssemblerProtocol
    let galleryItems: [GalleryItemModel]

    init(isPresented: Binding<Bool>,
         galleryItems: [GalleryItemModel],
         assembler: GalleryPhotosAssemblerProtocol = GalleryPhotosAssembler()) {
        self.isPresented = isPresented
        self.galleryItems = galleryItems
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
