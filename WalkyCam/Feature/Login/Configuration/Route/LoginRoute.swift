import Foundation
import SwiftUI
import Networking

struct LoginRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: LoginAssemblerProtocol
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: LoginAssemblerProtocol = LoginAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
