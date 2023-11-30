import Foundation
import SwiftUI

struct VideoCallRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: VideoCallAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: VideoCallAssemblerProtocol = VideoCallAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}