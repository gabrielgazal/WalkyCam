import SwiftUI

protocol ChatListViewModelProtocol: ViewModelProtocol {
    var channels: AsyncData<[ChannelModel], ErrorProtocol> { get set }

    func handleChatSelection(_ id: String) -> ChannelModel?
}
