import SwiftUI

protocol NotificationsViewModelProtocol: ViewModelProtocol {
    var notifications: [NotificationModel] { get set }
}
