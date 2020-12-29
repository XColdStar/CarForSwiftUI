//
//  TCCarTypeRecommendView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/23.
//

import SwiftUI

struct TCCarTypeRecommendView: View {
    @Binding var datas: [TCHomePageListChildren]
    var body: some View {
        HStack {
            ForEach(datas) { item in
                TCCarTypeRecommendSingleView(model: item)
            }
        }
    }
}

//struct TCCarTypeRecommendView_Previews: PreviewProvider {
//    static var previews: some View {
//        TCCarTypeRecommendView()
////            .previewLayout(.fixed(width: DeviceWidth, height: 108))
//    }
//}
