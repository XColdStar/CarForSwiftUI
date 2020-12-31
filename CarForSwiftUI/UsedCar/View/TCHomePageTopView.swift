//
//  TCHomePageTopView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/21.
//

import SwiftUI

struct TCHomePageTopView: View {
    
    @Binding var datas: [TCHomePageListChildren]
    
    var body: some View {
        let rows: [GridItem] = Array(repeating: GridItem(), count: 1)
        LazyHGrid(rows: rows, alignment: .center) {
            ForEach(datas) {data in
                VStack {
                    
                    NetworkImage(url: data.image ?? "")
                    
                    Spacer()
                        .frame(height:5)
                    
                    Text(data.title ?? "")
                        .font(.system(size: 12, weight: .light))
                    
                }
                .frame(width:(DeviceWidth-80)/5.0)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .frame(width: DeviceWidth-20,height: 88)
//        .shadow(radius: 5)
    }
}

//struct TCHomePageTopView_Previews: PreviewProvider {
//    @State static private var datas = [TCHomePageListChildren(data: nil, image: "", subTitle: "subtitle", title: "title")]
//    static var previews: some View {
//        TCHomePageTopView(datas: $datas)
//    }
//}
