//
//  Store.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 26/09/24.
//

import Foundation

protocol ReduxState { }

typealias Dispatcher = (Action) -> Void

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

struct AppState: ReduxState {
    var counterState: CounterState = CounterState()
    var taskState: TaskState = TaskState()
    var movies : MovieState = MovieState()
}

struct MovieState: ReduxState {
    var movies = [Movie]()
    var selectedMovieDetail: MovieDetail?
}

struct FetchMovies: Action {
    let search: String
}

struct FetchMovieDetails: Action {
    let imdbID: String
}

struct SetMovieDetails: Action {
    let details: MovieDetail
}

struct SetMovies: Action {
    let movies: [Movie]
}

struct TaskState: ReduxState {
    var task: [Task] = [Task]()
}

struct CounterState: ReduxState {
    var counter: Int = 0
}

protocol Action {
    
}

struct IncrementAction: Action { }
struct DecrementAction: Action { }
struct IncrementActionAsync: Action { }

struct AddTaskAction: Action {
    let task: Task
}

struct OnAddAction: Action {
    let value: Int
}

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middleWares: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middlewares: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middleWares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        middleWares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}


