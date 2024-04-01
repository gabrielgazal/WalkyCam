import Foundation
import SwiftUI

struct RobotMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: RobotMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: RobotMenuAssemblerProtocol = RobotMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}