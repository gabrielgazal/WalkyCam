import SwiftUI

protocol LegalDocumentationAssemblerProtocol {
    func resolveView(
        route: LegalDocumentationRoute
    ) -> LegalDocumentationView<LegalDocumentationViewModel, LegalDocumentationRouter>
}