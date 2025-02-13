//
//  Language.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 03/10/24.
//

import Foundation

public enum Language: String, CaseIterable {
    case english_us = "en"
    case spanish = "es"
}

class LanguageManager: ObservableObject {

    static let shared = LanguageManager()
    static let changedLanguage = Notification.Name("changedLanguage")

    private init() {}
    
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                return .english_us
            }
            return Language(rawValue: languageString) ?? .english_us
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
                NotificationCenter.default.post(name: LanguageManager.changedLanguage, object: nil)
            }
        }
    }
    
    public func changeLanguage(language: Language) {
        self.language = language
        NotificationCenter.default.post(name: LanguageManager.changedLanguage, object: nil)
    }
}

public extension Language {
    var emoji: String {
        switch self {
        case .english_us:
            return "🇺🇸"
        case .spanish:
            return "🇪🇸"
        }
    }
    
    var title: String {
        switch self {
        case .english_us:
            return "English"
        case .spanish:
            return "Español"
        }
    }
    
    var locale: Locale {
        switch self {
        case .english_us:
            return Locale(identifier: "en_US")
        case .spanish:
            return Locale(identifier: "es_ES")
        }
    }
}

extension LanguageManager {
    var bundle: Bundle {
        guard let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return Bundle.main
        }
        return bundle
    }
}

