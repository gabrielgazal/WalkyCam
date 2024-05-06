import SwiftUI

final class LegalDocumentationAssembler: LegalDocumentationAssemblerProtocol {
    func resolveView(
        route: LegalDocumentationRoute
    ) -> LegalDocumentationView<LegalDocumentationViewModel, LegalDocumentationRouter> {

        let router = LegalDocumentationRouter(isPresented: route.isPresented)

        let interactor = LegalDocumentationInteractor(
            useCases: .init()
        )
        let viewModel = LegalDocumentationViewModel(interactor: interactor)
        let view = LegalDocumentationView(viewModel: viewModel, router: router)

        return view
    }
}
