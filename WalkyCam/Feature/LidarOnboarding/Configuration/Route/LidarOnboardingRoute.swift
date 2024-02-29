import Foundation
import SwiftUI

struct LidarOnboardingRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: LidarOnboardingAssemblerProtocol

    init(isPresented: Binding<Bool>,
         assembler: LidarOnboardingAssemblerProtocol = LidarOnboardingAssembler()) {
        self.isPresented = isPresented
        self.assembler = assembler
    }

    func build() -> AnyView {
        AnyView(assembler.resolveView(route: self))
    }
}