//
//  TCHomeLookedModel.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/29.
//

import Foundation

class TCHomeLookedModel: NSObject, NSSecureCoding, Identifiable {
    var id = UUID()
    static var supportsSecureCoding: Bool = true
    
    func encode(with coder: NSCoder) {
        coder.encode(self.data, forKey: "data")
        coder.encode(self.image, forKey: "image")
        coder.encode(self.subTitle, forKey: "subTitle")
        coder.encode(self.title, forKey: "title")
    }
    
    required init?(coder: NSCoder) {
        self.data = coder.decodeObject(forKey: "data") as? String
        self.image = coder.decodeObject(forKey: "image") as? String
        self.subTitle = coder.decodeObject(forKey: "subTitle") as? String
        self.title = coder.decodeObject(forKey: "title") as? String
    }
    
    override init() {}
    
    convenience init(item: TCHomePageListChildren) {
        self.init()
        self.data = item.data
        self.image = item.image
        self.subTitle = item.subTitle
        self.title = item.title
    }
    
    var data : String?
    var image : String?
    var subTitle : String?
    var title : String?
    
}
