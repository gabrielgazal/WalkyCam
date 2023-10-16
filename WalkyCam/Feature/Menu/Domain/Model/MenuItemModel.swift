import SwiftUI

struct MenuItemModel: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let routeToNavigate: Route
}
