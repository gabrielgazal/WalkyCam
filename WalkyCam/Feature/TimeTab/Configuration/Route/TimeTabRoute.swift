import Foundation
import SwiftUI

struct TimeTabRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: TimeTabAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: TimeTabAssemblerProtocol = TimeTabAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}