import Foundation
import SwiftUI
import Networking

struct ComparePlansRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: ComparePlansAssemblerProtocol
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: ComparePlansAssemblerProtocol = ComparePlansAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
