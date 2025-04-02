import Foundation
import SwiftUI

struct NativeVideoCallRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: NativeVideoCallAssemblerProtocol
    var videoCallId: String
    
    init(
        videoCallId: String,
        isPresented: Binding<Bool>,
        assembler: NativeVideoCallAssemblerProtocol = NativeVideoCallAssembler()
    ) {
        self.videoCallId = videoCallId
        self.isPresented = isPresented
        self.assembler = assembler
    }
    
    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
