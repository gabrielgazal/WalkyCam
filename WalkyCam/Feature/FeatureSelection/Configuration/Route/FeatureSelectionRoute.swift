import Foundation
import SwiftUI

struct FeatureSelectionRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: FeatureSelectionAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: FeatureSelectionAssemblerProtocol = FeatureSelectionAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}