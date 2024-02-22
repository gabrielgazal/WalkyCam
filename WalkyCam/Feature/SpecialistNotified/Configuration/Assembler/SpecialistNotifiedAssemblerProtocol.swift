import SwiftUI

protocol SpecialistNotifiedAssemblerProtocol {
    func resolveView(
        route: SpecialistNotifiedRoute
    ) -> SpecialistNotifiedView<SpecialistNotifiedViewModel, SpecialistNotifiedRouter>
}