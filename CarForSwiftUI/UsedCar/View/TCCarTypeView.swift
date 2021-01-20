//
//  TCCarTypeView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/22.
//

import SwiftUI

struct TCCarTypeView: View {
    var datas: [TCHomePageListChildren]
    @EnvironmentObject var lookedManager: TCLookedManager
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.fixed((DeviceWidth-70)/4.0)), count: 4)
        LazyVGrid(columns: columns,spacing:10) {
            ForEach(datas) { item in
                Text(item.title ?? "")
                    .lineLimit(1)
                    .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .font(.system(size: 12, weight: .light))
                    .frame(width:(DeviceWidth-70)/4.0)
                    .background (
                        RoundedRectangle(cornerRadius: 16, style: .circular)
                            .fill(BlueColor_Back)
                    )
                    .onTapGesture {
                        lookedManager.save(model: TCHomeLookedModel(item: item))
                    }
            }
        }
//        .background(Color.blue)
        .fixedSize()
    }
}

struct TCCarTypeView_Previews: PreviewProvider {
    @State static private var datas = [TCHomePageListChildren(data: nil, image: "", subTitle: "subtitle", title: "title")]
    static var previews: some View {
        TCCarTypeView(datas: datas)
    }
}
