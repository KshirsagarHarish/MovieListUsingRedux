//
//  MovieReducer.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 03/10/24.
//

import Foundation

func movieReducer(_ state: MovieState, _ action: Action) -> MovieState {
    var state = state
    
    switch action {
    case let action as SetMovies:
        state.movies = action.movies
        
    case let action as SetMovieDetails:
        state.selectedMovieDetail = action.details
        
    default:
        break
    }
    return state
}
