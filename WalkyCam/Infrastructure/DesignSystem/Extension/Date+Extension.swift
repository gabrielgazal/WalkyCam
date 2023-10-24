//
//  Date+Extension.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 24/10/23.
//

import Foundation

public extension Date {

    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        return dateFormatter
    }

    func string(format: DateFormat) -> String {
        let formatter = dateFormatter
        formatter.dateFormat = format.dateFormat
        let dateString = formatter.string(from: self)
        return dateString
    }

    func relativeTimeFormatted(format: DateFormat = SharedDateFormat.standardDateTime) -> String {
        let formatter = dateFormatter
        formatter.dateStyle = .short
        formatter.doesRelativeDateFormatting = true
        var dateString = formatter.string(from: self)
        if dateString.rangeOfCharacter(from: .decimalDigits) != nil {
            formatter.dateFormat = format.dateFormat
            formatter.doesRelativeDateFormatting = false
            dateString = formatter.string(from: self)
        } else {
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            var timeString = formatter.string(from: self)
            if let range = timeString.range(of: ":") {
                timeString = timeString.replacingCharacters(in: range, with: "h")
            }
            dateString += ", \(timeString)"
        }
        return dateString
    }
}
