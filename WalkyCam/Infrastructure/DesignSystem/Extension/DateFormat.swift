//
//  DateFormat.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 24/10/23.
//

import Foundation

public protocol DateFormat {
    var dateFormat: String { get }
}

public enum SharedDateFormat: DateFormat {
    case standardDate
    case standardDateTime
    case iSO8601
    case custom(String)

    public var dateFormat: String {
        let format: String

        switch self {
        case .standardDate: format = "dd/MM/yyyy"
        case .standardDateTime: format = "dd/MM/yyyy, HH'h'mm"
        case .iSO8601: format = "yyyy-MM-dd'T'HH:mm:ss"
        case let .custom(associatedFormat): format = associatedFormat
        }
        return format
    }
}
