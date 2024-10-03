//
//  View+Extensions.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 01/10/24.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
