//
//  MovieDetailView.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 03/10/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    @EnvironmentObject var store: Store<AppState>
    let movie: Movie
    
    struct Props {
        let movieDetails: MovieDetail?
        let onLoadMoviewDetails: (String) -> Void
    }
    
    private func map(state: MovieState) -> Props {
        Props(movieDetails: state.selectedMovieDetail) { imdbID in
            store.dispatch(action: FetchMovieDetails(imdbID: imdbID))
        }
    }

    var body: some View {
        VStack {
            let props = map(state: store.state.movies)
            
                if let details = props.movieDetails {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            AsyncImage(url: URL(string: details.poster)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(15)
                            } placeholder: {
                                Circle()
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 200, height: 300)
                            Spacer()
                        }
                        
                        VStack {
                            Text(details.title).padding(5)
                            Text(details.plot).padding(5)
                        }
                        .padding(.horizontal)
                        .bold()
                        
                        HStack {
                            Text("Rating")
                            RatingView(rating: .constant(details.imdbRating.toInt()))
                        }.padding()
                        
                    }
                } else {
                    Text("Loading...")
                }
                
                Spacer()
            
            
            .onAppear(perform: {
                props.onLoadMoviewDetails(movie.imdbID)
            })
        }
    }
}

#Preview {
    
    let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])

    return MovieDetailView(movie: Movie(title: "Batman", poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg", imdbID: "tt4853102", year: "2011")).environmentObject(store)
}
