import Foundation

struct CryptoActivityModel: Hashable {
    let title: String
    let currentValue: Double
    let variation: Double
    let graph: String
    let balance: Double
    let type: CryptoActivityType

    public init(
        title: String = "",
        currentValue: Double = 0.0,
        variation: Double = 0.0,
        graph: String = "",
        balance: Double = 0.0,
        type: CryptoActivityType = CryptoActivityType.none
    ) {
        self.title = title
        self.currentValue = currentValue
        self.variation = variation
        self.graph = graph
        self.balance = balance
        self.type = type

    }
}

extension CryptoActivityModel {
    enum CryptoActivityType {
        case pi
        case rc2
        case `none`
    }
}
