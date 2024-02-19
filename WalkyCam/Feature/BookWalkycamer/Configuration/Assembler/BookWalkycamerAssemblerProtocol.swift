import SwiftUI

protocol BookWalkycamerAssemblerProtocol {
    func resolveView(
        route: BookWalkycamerRoute
    ) -> BookWalkycamerView<BookWalkycamerViewModel, BookWalkycamerRouter>
}