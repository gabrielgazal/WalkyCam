import Foundation
import SwiftUI

struct ShareSheetRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ShareSheetAssemblerProtocol
    let title: String
    let link: String

    init(isPresented: Binding<Bool>,
         assembler: ShareSheetAssemblerProtocol = ShareSheetAssembler(),
         title: String,
         link: String
    ) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.title = title
        self.link = link
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
