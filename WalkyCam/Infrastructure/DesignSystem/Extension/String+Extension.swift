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
      return try AttributedString(markdown: self)
    } catch {
      print("Error parsing Markdown for string \(self): \(error)")
      return AttributedString(self)
    }
  }
}