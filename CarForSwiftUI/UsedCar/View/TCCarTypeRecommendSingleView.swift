//
//  TCCarTypeRecommendSingleView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/23.
//

import SwiftUI

struct TCCarTypeRecommendSingleView: View {
    var model: TCHomePageListChildren
    var body: some View {
        ZStack() {
            NetworkImage(url: model.image ?? "",imageSize: CGSize(width:(DeviceWidth-40)/3.0,height: 88))
                .frame(width:(DeviceWidth-40)/3.0,height: 88)
                .aspectRatio(contentMode: .fit)
                .scaledToFill()

            HStack {
                Spacer()
                    .frame(width:10)
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height:10)
                    Text(model.title ?? "")
                        .font(.system(size: 12))
                    Spacer()
                        .frame(height: 2)
                    Text(model.subTitle ?? "")
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

//struct TCCarTypeRecommendSingleView_Previews: PreviewProvider {
//    static var previews: some View {
//        TCCarTypeRecommendSingleView()
//    }
//}
