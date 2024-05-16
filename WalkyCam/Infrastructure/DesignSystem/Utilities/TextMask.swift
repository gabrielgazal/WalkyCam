//
//  TextMask.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 16/05/24.
//

import SwiftUI

public protocol TextMask {
    var maskFormat: String { get }
    func formatValue(_ value: String) -> String
    func removeFormat(_ value: String) -> String
}

public extension TextMask {
    func formatValue(_ value: String) -> String {
        let cleanValue = value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = maskFormat
        var result = ""
        var index = cleanValue.startIndex
        for char in mask where index < cleanValue.endIndex {
            if char == "#" {
                result.append(cleanValue[index])
                index = cleanValue.index(after: index)
            } else {
                result.append(char)
            }
        }
        return result
    }
    
    func removeFormat(_ value: String) -> String {
        let charactersToRemove = maskFormat.replacingOccurrences(of: "#", with: "")
        
        return value.filter { character in
            !charactersToRemove.contains { $0 == character }
        }
    }
}

struct TelephoneMask: TextMask {
    public var maskFormat: String = "(##) #####-####"
    public init() {}
}

struct DateMask: TextMask {
    public var maskFormat: String = "##/##/####"
    public init() {}
}

struct CPFMask: TextMask {
    var maskFormat: String = "###.###.###-##"
    public init() {}
}

struct ZipCodeMask: TextMask {
    var maskFormat: String = "#####-###"
    public init() {}
    func removeFormat(_ value: String) -> String {
        var updatedValue = value

        for char in maskFormat {
            if let range = updatedValue.range(of: String(char)) {
                updatedValue.removeSubrange(range)
            }
        }

        return updatedValue
    }
}

struct CurrencyMask: TextMask {

    enum MaskType {
        case noCents
        case `default`

        var cents: Int {
            switch self {
            case .noCents:
                return 0
            case .`default`:
                return 2
            }
        }
    }

    var maskFormat: String = ""
    var maskType: MaskType
    var maxNumberOfDigits: Int

    public init(
        type: MaskType = .noCents,
        maxNumberOfDigits: Int = 9
    ) {
        self.maskType = type
        self.maxNumberOfDigits = maxNumberOfDigits
    }

    func formatValue(_ value: String) -> String {
        return currency(from: value)
    }
    
    func removeFormat(_ value: String) -> String {
        let numberFormatter = formatter()
        return numberFormatter.number(from: value)?.stringValue ?? ""
    }

    private func currency(from value: String) -> String {
        let formatter = formatter()
        var formatValue: String = value
        if value.digits.count > maxNumberOfDigits {
            formatValue.removeLast()
        }
        guard !value.isEmpty,
            value.trimmingCharacters(in: .whitespacesAndNewlines) != formatter.currencySymbol! else {
            return ""
        }
        
        let decimal = formatValue.decimal / pow(10, formatter.maximumFractionDigits)
        return formatter.string(for: decimal) ?? ""
    }
    
    private func formatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = maskType.cents
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }
}

private extension StringProtocol where Self: RangeReplaceableCollection {
    var digits: Self { filter(\.isWholeNumber) }
}

private extension String {
    var decimal: Decimal { Decimal(string: digits) ?? 0 }
}

struct MaxAreaMask: TextMask {
    var maskFormat: String = "#########"
    public init() {}
}
