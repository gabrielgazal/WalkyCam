import Foundation
import SwiftUI

struct ScheduleVideoCallRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ScheduleVideoCallAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: ScheduleVideoCallAssemblerProtocol = ScheduleVideoCallAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}