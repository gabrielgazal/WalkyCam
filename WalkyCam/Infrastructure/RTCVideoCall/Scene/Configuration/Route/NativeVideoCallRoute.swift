import Foundation
import SwiftUI

struct NativeVideoCallRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: NativeVideoCallAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: NativeVideoCallAssemblerProtocol = NativeVideoCallAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}