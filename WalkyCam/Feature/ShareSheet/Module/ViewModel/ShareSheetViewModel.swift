import SwiftUI

final class ShareSheetViewModel: ShareSheetViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ShareSheetInteractorProtocol
    @Published var title: String
    @Published var link: String

    // MARK: - Initialization

    init(interactor: ShareSheetInteractorProtocol = ShareSheetInteractor(),
         title: String,
         link: String
    ) {
        self.interactor = interactor
        self.title = title
        self.link = link
    }
}
