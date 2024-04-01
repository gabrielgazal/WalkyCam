import SwiftUI

protocol DigitalTwinsMenuAssemblerProtocol {
    func resolveView(
        route: DigitalTwinsMenuRoute
    ) -> DigitalTwinsMenuView<DigitalTwinsMenuViewModel, DigitalTwinsMenuRouter>
}