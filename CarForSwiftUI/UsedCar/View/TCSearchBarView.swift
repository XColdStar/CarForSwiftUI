//
//  TCSearchBarView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/21.
//

import SwiftUI

struct TCSearchBarView: View {
    var body: some View {
        HStack() {
            Spacer()
                .frame(width:20)
            
            Text("北京")
                .font(.subheadline)
            
            Image(systemName: "chevron.down")
                .foregroundColor(GrayColor)
                .font(.subheadline)
            
            Rectangle()
                .frame(width:1,height: 20)
                .foregroundColor(GrayColor)
            
            Spacer()
                .frame(width:15)
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(GrayColor_Text)
                .font(.system(size: 14, weight: .light))
            
            Text("搜索品牌、级别")
                .foregroundColor(GrayColor_Text)
                .font(.system(size: 13, weight: .light))
            
            Spacer()
        }
        .frame(width:DeviceWidth-20, height: 36)
        .background(
            RoundedRectangle(cornerRadius: 50, style: .continuous)
                .fill(Color.white)
        )
        .overlay (
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(GrayColor, lineWidth: 0.5)
        )
//        .background(Color.white)
    }
}

struct TCSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        TCSearchBarView()
            .previewLayout(.fixed(width: DeviceWidth, height: 30))
    }
}
