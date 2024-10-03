//
//  Constants.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 01/10/24.
//

import Foundation

struct Constants {
    
    struct ApiKeys {
        static let omdbIDKey = "5c248545"
    }
    
    struct urls {
        static func urlBySearch(search: String) -> String {
            "https://www.omdbapi.com/?s=\(search)&page=1&apikey=\(ApiKeys.omdbIDKey)"
        }
        static func urlForMoviewDetailByImdbID(ImdbID: String) -> String {
            "https://www.omdbapi.com/?i=\(ImdbID)&apikey=\(ApiKeys.omdbIDKey)"
        }
    }
}


