//
//  TCCarBrandView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/22.
//

import SwiftUI

struct TCCarBrandView: View {
    var datas: [TCHomePageListChildren]
    var body: some View {
        let width = (DeviceWidth-20)/6.0
        let columns: [GridItem] = Array(repeating: .init(.fixed(width)), count: 5)
        LazyVGrid(columns: columns) {
            ForEach(datas) { item in
                VStack {
                    Group {
                        if item == datas.last {
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .frame(width:25,height:25)
                                .foregroundColor(.gray)
                        } else {
                            NetworkImage(url: item.image ?? "",imageSize: CGSize(width: 30, height: 30))
                        }
                    }
                    Spacer()
                        .frame(height:5)
                    Text(item == datas.last ? "更多" : item.title ?? "")
                        .frame(width:width)
                        .font(.system(size: 13, weight: .light))
                }
                .padding(.top,5)
            }
        }
    }
}

//struct TCCarBrandView_Previews: PreviewProvider {
//    static var previews: some View {
//        TCCarBrandView()
//    }
//}
