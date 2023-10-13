import SwiftUI

protocol RegistrationAssemblerProtocol {
    func resolveView(
        route: RegistrationRoute
    ) -> RegistrationView<RegistrationViewModel, RegistrationRouter>
}