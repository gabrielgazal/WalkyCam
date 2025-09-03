import SwiftUI

final class AssistantMenuAssembler: AssistantMenuAssemblerProtocol {
    func resolveView(
        route: AssistantMenuRoute
    ) -> AssistantMenuView<AssistantMenuViewModel, AssistantMenuRouter> {
        
        print("Creating router...")
        let router = AssistantMenuRouter(isPresented: route.isPresented)
        
        print("Creating interactor...")
        let interactor = AssistantMenuInteractor(useCases: .init())
        
        print("Creating viewModel...")
        let viewModel = AssistantMenuViewModel(interactor: interactor)
        
        print("Creating view...")
        let view = AssistantMenuView(viewModel: viewModel, router: router)
        
        print("Returning view...")
        return view
    }
}
