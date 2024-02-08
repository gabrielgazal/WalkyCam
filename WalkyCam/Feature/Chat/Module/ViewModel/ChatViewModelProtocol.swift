import SwiftUI

protocol ChatViewModelProtocol: ViewModelProtocol {
    var channels: [ChannelModel] { get set }
}
