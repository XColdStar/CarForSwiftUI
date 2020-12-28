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
    
    var imageUrl: String = ""
    var contentMode: UIView.ContentMode = .scaleToFill
    
    func makeUIView(context: Context) -> UIImageView {
        let imgView = UIImageView()
        return imgView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.contentMode = contentMode
        uiView.kf.setImage(with: URL(string: imageUrl))
    }
}
