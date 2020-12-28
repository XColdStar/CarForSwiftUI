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
}

class TCHomePageList: TCBaseModel {
    var list : [TCHomePageListChildren]?
    var typeId : String?
    var typeName : String?
}



