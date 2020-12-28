//
//  TCCarTypeRecommendSingleView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/23.
//

import SwiftUI

struct TCCarTypeRecommendSingleView: View {
    var body: some View {
        ZStack(alignment:.bottomTrailing) {
            Image(systemName: "car")
                .font(.system(size: 40, weight: .light))
                .foregroundColor(.yellow)
            
            HStack {
                Spacer()
                    .frame(width:10)
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height:10)
                    Text("城市代步")
                        .font(.system(size: 12))
                    Text("省时省力")
                        .font(.system(size: 10, weight: .light))
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(width:(DeviceWidth-40)/3.0,height: 88)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.white)
//                .shadow(radius: 3)
        )
    }
}

struct TCCarTypeRecommendSingleView_Previews: PreviewProvider {
    static var previews: some View {
        TCCarTypeRecommendSingleView()
    }
}
