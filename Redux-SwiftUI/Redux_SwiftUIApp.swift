//
//  Redux_SwiftUIApp.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 26/09/24.
//

import SwiftUI

@main
struct Redux_SwiftUIApp: App {
    
    let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
