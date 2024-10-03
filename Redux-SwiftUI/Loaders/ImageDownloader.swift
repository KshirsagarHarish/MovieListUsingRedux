//
//  ImageDownloader.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 01/10/24.
//

import Foundation

class ImageDownloader: ObservableObject {
    
    @Published var downloadData: Data? = nil
    
    func downloadImage(url: String) {
        
        guard let imageURL = URL(string: url) else{
            fatalError("Image URL is incorrect")
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadData = data
            }
        }
    }
}
