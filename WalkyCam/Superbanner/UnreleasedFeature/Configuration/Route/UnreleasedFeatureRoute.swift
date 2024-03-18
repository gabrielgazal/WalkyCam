import Foundation
import SwiftUI

struct UnreleasedFeatureRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: UnreleasedFeatureAssemblerProtocol
    let banners: [String]

    init(isPresented: Binding<Bool>,
         banners: [String],
         assembler: UnreleasedFeatureAssemblerProtocol = UnreleasedFeatureAssembler()) {
        self.isPresented = isPresented
        self.banners = banners
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
