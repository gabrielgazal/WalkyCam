import Foundation
import SwiftUI

struct IOTMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: IOTMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: IOTMenuAssemblerProtocol = IOTMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}