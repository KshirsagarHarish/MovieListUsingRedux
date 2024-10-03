//
//  MovieMiddleware.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 03/10/24.
//

import Foundation

func moviesMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        
        switch action {
        case let action as FetchMovies:
            Webservice().getMovieBy(search: action.search) { result in
                switch result {
                case .success(let movies):
                    if let movies = movies {
                        //set the movies
                        dispatch(SetMovies(movies: movies))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case let action as FetchMovieDetails:
            Webservice().getMovieDetailsBy(imbdID: action.imdbID) { result in
                switch result {
                case .success(let movieDetails):
                    if let movieDetails = movieDetails {
                        //set the movies
                        dispatch(SetMovieDetails(details: movieDetails))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            break
        }
    }
    
}
