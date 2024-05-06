import SwiftUI

protocol IdentityUploadAssemblerProtocol {
    func resolveView(
        route: IdentityUploadRoute
    ) -> IdentityUploadView<IdentityUploadViewModel, IdentityUploadRouter>
}