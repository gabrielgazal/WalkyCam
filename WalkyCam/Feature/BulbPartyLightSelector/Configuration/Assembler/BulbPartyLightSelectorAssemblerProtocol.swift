import SwiftUI

protocol BulbPartyLightSelectorAssemblerProtocol {
    func resolveView(
        route: BulbPartyLightSelectorRoute
    ) -> BulbPartyLightSelectorView<BulbPartyLightSelectorViewModel, BulbPartyLightSelectorRouter>
}