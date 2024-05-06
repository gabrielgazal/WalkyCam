import Foundation
import SwiftUI

struct IdentityUploadRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: IdentityUploadAssemblerProtocol
    let data: CamerRegistrationData
    
    init(isPresented: Binding<Bool>,
         data: CamerRegistrationData,
         assembler: IdentityUploadAssemblerProtocol = IdentityUploadAssembler()) {
        self.isPresented = isPresented
        self.data = data
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}
