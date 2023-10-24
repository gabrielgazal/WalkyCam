import Foundation
import SwiftUI

struct NotificationModel: Hashable, Comparable {
    static func < (lhs: NotificationModel, rhs: NotificationModel) -> Bool {
        return lhs.date < rhs.date
    }

    let image: String
    let title: String?
    let description: String
    let date: Date
    let backgroundColor: Color
}
