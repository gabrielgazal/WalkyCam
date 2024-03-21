import Foundation
import SwiftUI
import Networking

struct PlansPagesRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: PlansPagesAssemblerProtocol
    let currentPage: Int
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: PlansPagesAssemblerProtocol = PlansPagesAssembler(),
         currentPage: Int) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.currentPage = currentPage
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
