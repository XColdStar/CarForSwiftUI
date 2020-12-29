//
//  TCBaseModel.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/24.
//

import SwiftUI
import HandyJSON

class TCBaseModel: Identifiable, HandyJSON, ObservableObject, Equatable {
    static func == (lhs: TCBaseModel, rhs: TCBaseModel) -> Bool {
        lhs.id == rhs.id
    }
    
    required init() {}
    var id = UUID()
}
