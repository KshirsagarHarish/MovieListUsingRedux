//
//  ContentView.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 26/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @State var searchText: String = ""

    struct Props {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }
    
    private func map(state: MovieState) -> Props {
        Props(movies: state.movies) { keyword in
            store.dispatch(action: FetchMovies(search: keyword))
        }
    }
    
    var body: some View {
        let props = map(state: store.state.movies)
        
        VStack(alignment: .leading) {
            
            TextField("Search Movie", text: $searchText, onEditingChanged: { _ in
                
            }, onCommit: {
                props.onSearch(searchText)
            })
                .textFieldStyle(.roundedBorder)
                .border(.gray, width: 1)
                .padding()
            
            List(props.movies, id: \.imdbID) { movie in
                NavigationLink {
                    MovieDetailView(movie: movie)
                } label: {
                    MovieCell(movie: movie)
                }
                .padding(.vertical)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Movies")
        .embedInNavigationView()
    }
}

#Preview {
    let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])
    return ContentView().environmentObject(store)
}

struct MovieCell: View {
    let movie: Movie
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.poster)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
            } placeholder: {
                Circle()
                    .foregroundColor(.gray)
            }
            .frame(width: 100, height: 100)
            
            Text(movie.title)
        }
    }
}

