import SwiftUI

protocol RegisterWalkcamerAssemblerProtocol {
    func resolveView(
        route: RegisterWalkcamerRoute
    ) -> RegisterWalkcamerView<RegisterWalkcamerViewModel, RegisterWalkcamerRouter>
}