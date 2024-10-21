//
//  Swiftgen+Extension.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 03/10/24.
//

import Foundation

extension L10n {
    static func switchLocalizationBundleDuringRuntime(forKey: String, table: String, fallbackValue: String) -> String {
        let resource = LanguageManager.shared.language.rawValue
        let bundle = Bundle(path: Bundle.main.path(forResource: resource, ofType: "lproj")!)
        let format = NSLocalizedString(forKey, tableName: table, bundle: bundle ?? Bundle(for: BundleToken.self), comment: "")
        return format
    }
}

private final class BundleToken {}
