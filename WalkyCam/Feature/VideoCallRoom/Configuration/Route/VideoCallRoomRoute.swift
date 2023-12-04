import Foundation
import SwiftUI

struct VideoCallRoomRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: VideoCallRoomAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: VideoCallRoomAssemblerProtocol = VideoCallRoomAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}