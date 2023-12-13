import Foundation
import SwiftUI

struct VideoCallRoomRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: VideoCallRoomAssemblerProtocol
    let meetLink: String

    init(isPresented: Binding<Bool>,
         meetLink: String,
         assembler: VideoCallRoomAssemblerProtocol = VideoCallRoomAssembler()) {
        self.isPresented = isPresented
        self.meetLink = meetLink
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
