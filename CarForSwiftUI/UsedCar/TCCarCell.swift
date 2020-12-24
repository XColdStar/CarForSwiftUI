//
//  TCCarCell.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/23.
//

import SwiftUI

struct TCCarCell: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "car")
                    .resizable()
                    .frame(width: DeviceWidth/3.0,height: 90)
                    .foregroundColor(.yellow)
                    .background (
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color.white)
                    )
                VStack(alignment:.leading) {
                    Spacer()
                        .frame(height:15)
                    Text("奔驰C级 2020款 改款 C 260 L 运动款")
                        .font(.headline)
                    Spacer()
                        .frame(height:5)
                    Text("准新车")
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(.blue)
                        .padding(.all,2)
                        .background(
                            RoundedRectangle(cornerRadius:3, style: .continuous)
                                .fill(BlueColor_Back)
                        )
                    Spacer()
                        .frame(height:5)
                    Text("2020年/1.68万公里/北京")
                        .font(.system(size: 13, weight: .light))
                    Spacer()
                        .frame(height:5)
                    Text("88.88万")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.red)
                }
                Spacer()
            }
            Rectangle()
                .foregroundColor(GrayColor_Line)
                .frame(height:1)
        }
        .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
        .background(Color.white)
    }
}

struct TCCarCell_Previews: PreviewProvider {
    static var previews: some View {
        TCCarCell()
    }
}
