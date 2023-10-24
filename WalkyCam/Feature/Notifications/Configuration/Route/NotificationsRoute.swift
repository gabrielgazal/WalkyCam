import Foundation
import SwiftUI

struct NotificationsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: NotificationsAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: NotificationsAssemblerProtocol = NotificationsAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}