import Foundation
import SwiftUI
import Networking

struct TabBarRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: TabBarAssemblerProtocol
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: TabBarAssemblerProtocol = TabBarAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
