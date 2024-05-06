import Foundation
import SwiftUI

struct FeatureInformationRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: FeatureInformationAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: FeatureInformationAssemblerProtocol = FeatureInformationAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}