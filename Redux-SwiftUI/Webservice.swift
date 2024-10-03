//
//  Webservice.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 01/10/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}

class Webservice {
    
    func getMovieBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
         
        guard let moviewURL = URL(string: Constants.urls.urlBySearch(search: search)) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: moviewURL) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse = movieResponse {
                completion(.success(movieResponse.movies))
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func getMovieDetailsBy(imbdID: String, completion: @escaping (Result<MovieDetail?, NetworkError>) -> Void) {
         
        guard let moviewURL = URL(string: Constants.urls.urlForMoviewDetailByImdbID(ImdbID: imbdID)) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: moviewURL) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            let movieDetails = try? JSONDecoder().decode(MovieDetail.self, from: data)
            if let movieDetails = movieDetails {
                completion(.success(movieDetails))
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}
