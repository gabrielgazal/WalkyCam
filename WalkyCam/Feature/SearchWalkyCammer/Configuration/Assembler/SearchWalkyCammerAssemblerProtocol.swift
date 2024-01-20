import SwiftUI

protocol SearchWalkyCammerAssemblerProtocol {
    func resolveView(
        route: SearchWalkyCammerRoute
    ) -> SearchWalkyCammerView<SearchWalkyCammerViewModel, SearchWalkyCammerRouter>
}