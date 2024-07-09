import Foundation
import SwiftUI

struct VideocallTimeTabRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: VideocallTimeTabAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: VideocallTimeTabAssemblerProtocol = VideocallTimeTabAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}