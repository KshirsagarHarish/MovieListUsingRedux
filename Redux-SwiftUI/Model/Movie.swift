//
//  Movie.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 01/10/24.
//

import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let title: String
    let poster: String
    let imdbID: String
    let year: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case poster = "Poster"
        case imdbID = "imdbID"
        case year = "Year"
    }
}
