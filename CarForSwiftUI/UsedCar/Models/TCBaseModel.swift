//
//  TCBaseModel.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/24.
//

import SwiftUI
import HandyJSON

class TCBaseModel: Identifiable, HandyJSON, ObservableObject {
    required init() {}
    var id = UUID()
}
