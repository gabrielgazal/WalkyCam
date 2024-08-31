import Foundation
import SwiftUI

struct TimedLoadingScreenRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: TimedLoadingScreenAssemblerProtocol
    let title: String
    let description: String
    let time: CGFloat
    let destinationRoute: Route

    init(isPresented: Binding<Bool>,
         title: String,
         description: String,
         time: CGFloat,
         destinationRoute: Route,
         assembler: TimedLoadingScreenAssemblerProtocol = TimedLoadingScreenAssembler()) {
        self.isPresented = isPresented
        self.title = title
        self.description = description
        self.time = time
        self.destinationRoute = destinationRoute
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
