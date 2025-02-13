//
//  String+Extension.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 13/10/23.
//

import Foundation
import SwiftUI

extension String {
    func toMarkdown() -> AttributedString {
        do {
            return try AttributedString(markdown: self, options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace))
        } catch {
            print("Error parsing Markdown for string \(self): \(error)")
            return AttributedString(self)
        }
    }
    
    func toDate(withFormat format: String = SharedDateFormat.standardDate.dateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
    }
    
    func localized() -> String {
        let resource = LanguageManager.shared.language.rawValue
        let bundle = Bundle(path: Bundle.main.path(forResource: resource, ofType: "lproj")!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle ?? .main, value: "", comment: "")
    }
}
