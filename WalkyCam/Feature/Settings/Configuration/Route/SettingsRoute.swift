import Foundation
import SwiftUI

struct SettingsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: SettingsAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: SettingsAssemblerProtocol = SettingsAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}