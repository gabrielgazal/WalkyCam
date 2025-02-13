//
//  Swiftgen+Extension.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 03/10/24.
//

import Foundation

extension L10n {
    static func switchLocalizationBundleDuringRuntime(forKey: String, table: String, fallbackValue: String) -> String {
        let format = NSLocalizedString(forKey, tableName: table, bundle: LanguageManager.shared.bundle, comment: "")
        return format
    }
}

private final class BundleToken {}
