//
//  TCCarTypeRecommendView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/23.
//

import SwiftUI

struct TCCarTypeRecommendView: View {
    var body: some View {
        HStack {
            ForEach(0..<3) { index in
                if index > 0 {
                    Spacer()
                        .frame(width:10)
                }
                TCCarTypeRecommendSingleView()
            }
        }
//        .background(Color.blue)
    }
}

struct TCCarTypeRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        TCCarTypeRecommendView()
//            .previewLayout(.fixed(width: DeviceWidth, height: 108))
    }
}
