import Foundation
import SwiftUI

struct ProfileRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ProfileAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ProfileAssemblerProtocol = ProfileAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}