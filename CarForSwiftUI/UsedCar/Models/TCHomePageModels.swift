//
//  TCHomePageModels.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/24.
//

import SwiftUI

class TCHomePageListChildren: TCBaseModel {
    var data : String?
    var image : String?
    var subTitle : String?
    var title : String?
    
    convenience init(data: String?, image: String?, subTitle: String?, title: String?) {
        self.init()
        self.data = data
        self.image = image
        self.subTitle = subTitle
        self.title = title
    }
}

class TCHomePageList: TCBaseModel {
    var list : [TCHomePageListChildren]?
    var typeId : String?
    var typeName : String?
}



