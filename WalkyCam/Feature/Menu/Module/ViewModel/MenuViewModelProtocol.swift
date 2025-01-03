import SwiftUI

protocol MenuViewModelProtocol: ViewModelProtocol {
    var menuItems: [MenuItemModel] { get set }
    func assembleMenuBannnerData() -> [MenuPlanBannerModel]
}
