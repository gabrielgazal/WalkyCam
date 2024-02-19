import Foundation
import SwiftUI

struct CalendarTabRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: CalendarTabAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: CalendarTabAssemblerProtocol = CalendarTabAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}