import Foundation
import SwiftUI
import Networking

struct StreetCamMenuRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: StreetCamMenuAssemblerProtocol
    
    @Dependency var retailRepository: RepositoryResolving

    init(isPresented: Binding<Bool>,
         assembler: StreetCamMenuAssemblerProtocol = StreetCamMenuAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
