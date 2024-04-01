import Foundation
import SwiftUI

struct DigitalTwinsMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: DigitalTwinsMenuAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: DigitalTwinsMenuAssemblerProtocol = DigitalTwinsMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}