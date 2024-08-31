import SwiftUI

final class TimedLoadingScreenViewModel: TimedLoadingScreenViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: TimedLoadingScreenInteractorProtocol
    @Published var title: String
    @Published var description: String
    @Published var time: CGFloat
    @Published var destinationRoute: Route
    
    // MARK: - Initialization
    
    init(interactor: TimedLoadingScreenInteractorProtocol = TimedLoadingScreenInteractor(),
         title: String,
         description: String,
         time: CGFloat,
         destinationRoute: Route
    ) {
        self.interactor = interactor
        self.title = title
        self.description = description
        self.time = time
        self.destinationRoute = destinationRoute
    }
}
