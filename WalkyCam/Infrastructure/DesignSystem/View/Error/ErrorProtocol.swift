public protocol ErrorProtocol: Error {
    var message: String { get set }
    var description: String { get set }
    var buttonTitle: String { get set }
    var icon: String { get set }
}
