import Foundation
import SwiftUI

struct GalleryModelsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: GalleryModelsAssemblerProtocol
    let galleryItems: [GalleryItemModel]

    init(isPresented: Binding<Bool>,
         galleryItems: [GalleryItemModel],
         assembler: GalleryModelsAssemblerProtocol = GalleryModelsAssembler()) {
        self.isPresented = isPresented
        self.galleryItems = galleryItems
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
