import Foundation
import SwiftUI

struct CammerDetailsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: CammerDetailsAssemblerProtocol
    var cammerData: CammerData
    var specialistMode: Bool

    init(isPresented: Binding<Bool>,
         assembler: CammerDetailsAssemblerProtocol = CammerDetailsAssembler(),
         cammerData: CammerData,
         specialistMode: Bool) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.cammerData = cammerData
        self.specialistMode = specialistMode
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
