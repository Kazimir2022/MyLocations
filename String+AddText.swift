//
//  String+AddText.swift
//  MyLocations
//
//  Created by Kazimir on 24.02.24.
//

import Foundation

extension String {
  mutating func add(
    text: String?,
    separatedBy separator: String = ""
  ) {
    if let text = text {
      if !isEmpty {
        self += separator
      }
      self += text
    }
  }
}
