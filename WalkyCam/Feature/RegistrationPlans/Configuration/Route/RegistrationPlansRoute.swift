import Foundation
import SwiftUI
import Networking

struct RegistrationPlansRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: RegistrationPlansAssemblerProtocol
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: RegistrationPlansAssemblerProtocol = RegistrationPlansAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
