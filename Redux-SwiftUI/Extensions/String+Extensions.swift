//
//  String+Extensions.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 01/10/24.
//

import Foundation

extension String {
    
    func urlEncode() -> String {
        self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? self
    }
    
    func toInt() -> Int {
        let ratingDouble = Double(self) ?? 0.0
        return Int(ratingDouble.rounded())
    }
}
