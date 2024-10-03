//
//  AppReducer.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 26/09/24.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.movies = movieReducer(state.movies, action)
    return state
}
