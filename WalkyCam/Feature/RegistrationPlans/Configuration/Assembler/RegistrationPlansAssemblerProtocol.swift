import SwiftUI

protocol RegistrationPlansAssemblerProtocol {
    func resolveView(
        route: RegistrationPlansRoute
    ) -> RegistrationPlansView<RegistrationPlansViewModel, RegistrationPlansRouter>
}