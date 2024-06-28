import Foundation
import SwiftUI
import Networking

struct VideoCallRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: VideoCallAssemblerProtocol
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: VideoCallAssemblerProtocol = VideoCallAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
