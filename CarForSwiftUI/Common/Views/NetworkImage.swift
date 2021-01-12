//
//  NetworkImage.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/25.
//

import SwiftUI

struct NetworkImage: View {
    var url: String
    var placeholder = Image("")
    var imageSize = CGSize(width: 35, height: 35)
    var cornerRadius = CGFloat(0.0)
    @State private var image: UIImage?
    var body: some View {
//        Image(uiImage: image ?? UIImage(systemName: "star")!)
//            .resizable()
//            .frame(width:30,height: 30)
//            .scaledToFit()
//            .aspectRatio(contentMode: .fit)
//            .onAppear (
//                perform: loadImage
//            )
        Group {
            if let img = image {
                Image(uiImage: img)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:imageSize.width,height: imageSize.height)
                    .clipped()
                    .cornerRadius(cornerRadius)
            } else {
//                ProgressView()
                placeholder
                    .onAppear (
                        perform: loadImage
                    )
            }
        }
    }
    
    func loadImage() {
        let imageURL = URL(string: self.url)
        guard let Url = imageURL else {
            return
        }
        
        let imageData = URLCache.shared.cachedResponse(for: URLRequest(url: Url))?.data
        guard imageData == nil else {
            image = UIImage(data: imageData!)
            return
        }
        
        URLSession.shared.dataTask(with: Url) {(imageData, response, error) in
            if error == nil && imageData != nil {
                image = UIImage(data: imageData!)
            }
        }.resume()
    }
}

//struct NetworkImage_Previews: PreviewProvider {
//    static var previews: some View {
//        NetworkImage(url: "")
//    }
//}
