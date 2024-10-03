//
//  URLImage.swift
//  Redux-SwiftUI
//
//  Created by Harish Kshirsagar on 01/10/24.
//

import Foundation
import SwiftUI

struct URLImage: View {
    
    let url: String
    @ObservedObject private var imageDownloader: ImageDownloader = ImageDownloader()
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        
        if let imageData = self.imageDownloader.downloadData {
            
            let img = UIImage(data: imageData)
            
            return VStack {
                Image(uiImage: img!).resizable()
            }
        } else {
            return VStack {
                Image("Placeholder").resizable()
            }
        }
    }
}
