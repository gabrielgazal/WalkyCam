import Foundation
import SwiftUI

struct StreetCamMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: StreetCamMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: StreetCamMenuAssemblerProtocol = StreetCamMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}