//
//  Color+Extension.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/21.
//

import SwiftUI

let GrayColor = Color(hex: 0xDBDBDB)
let GrayColor_Text = Color(hex: 0x9598A7)
let GrayColor_Back = Color(hex: 0xF5F7FB)
let BlueColor_Back = Color(hex: 0xF2F6FF)
let GrayColor_Line = Color(hex: 0xF6F6F6)

extension Color {
    
    init(hex: Int, alpha: Double) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
    
    init(hex: Int) {
        self.init(hex: hex, alpha: 1.0)
    }
    
}
