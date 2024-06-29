import Foundation
import SwiftUI

struct UnavailableFeatureRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: UnavailableFeatureAssemblerProtocol
    let icon: String
    let title: String
    init(isPresented: Binding<Bool>,
         icon: String,
         title: String,
         assembler: UnavailableFeatureAssemblerProtocol = UnavailableFeatureAssembler()) {
        self.isPresented = isPresented
        self.icon = icon
        self.title = title
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
