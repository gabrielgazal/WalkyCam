import Foundation
import SwiftUI

struct CammerDetailsRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: CammerDetailsAssemblerProtocol
    var cammerData: CammerData

    init(isPresented: Binding<Bool>,
         assembler: CammerDetailsAssemblerProtocol = CammerDetailsAssembler(),
         cammerData: CammerData) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.cammerData = cammerData
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
