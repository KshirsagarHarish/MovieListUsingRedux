//
//  MovieDetail.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 03/10/24.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let plot: String
    let poster: String
    let imdbRating: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating = "imdbRating"
    }
}
