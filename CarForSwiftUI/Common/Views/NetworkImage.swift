//
//  NetworkImage.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/25.
//

import SwiftUI

struct NetworkImage: View {
    var url: String
    var imageSize = CGSize(width: 35, height: 35)
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
                    .frame(width:imageSize.width,height: imageSize.height)
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }.onAppear (
            perform: loadImage
        )
    }
    
    func loadImage() {
        let imageURL = URL(string: self.url)
        if let Url = imageURL {
            URLSession.shared.dataTask(with: Url) {(imageData, response, error) in
                if error == nil && imageData != nil {
                    self.image = UIImage(data: imageData!)
                }
            }.resume()
        }
    }
}

//struct NetworkImage_Previews: PreviewProvider {
//    static var previews: some View {
//        NetworkImage(url: "")
//    }
//}
