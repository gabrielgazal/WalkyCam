import Foundation

struct MessageModel: Hashable {
    public var id: UUID = .init()
    public var username: String
    public var text: String
}
