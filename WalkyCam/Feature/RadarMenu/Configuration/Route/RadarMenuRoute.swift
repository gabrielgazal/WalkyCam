import Foundation
import SwiftUI

struct RadarMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: RadarMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: RadarMenuAssemblerProtocol = RadarMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}