//
//  NetworkImage.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/25.
//

import SwiftUI
import Kingfisher

struct ImageView: UIViewRepresentable {
    
    typealias UIViewType = UIImageView
    
    var imageUrl: String
    var placeholder = UIImage(named: "")
    var imageSize = CGSize(width:100, height: 100)
    fileprivate let imageView = UIImageView()
    
    func makeUIView(context: Context) -> UIImageView {
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.kf.setImage(with: URL(string: imageUrl),
                           placeholder: placeholder,
                           options: [.transition(ImageTransition.fade(0.5))],
                           completionHandler: ({ Result in
                            switch Result {
                            case .success(_): self.imageView.image = scaleImage()
                            case .failure(_): break;
                            }
                           }))
    }
    
    func scaleImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
        imageView.draw(CGRect.zero)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!;
    }
}
