//
//  TCCarBrandView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/22.
//

import SwiftUI

struct TCCarBrandView: View {
    var body: some View {
        let width = (DeviceWidth-20)/6.0
        let columns: [GridItem] = Array(repeating: .init(.fixed(width)), count: 5)
        LazyVGrid(columns: columns) {
            ForEach(0..<10) { item in
                VStack {
                    Image(systemName: item == 9 ? "ellipsis.circle.fill" : "car")
                        .resizable()
                        .frame(width:30,height:30)
                        .foregroundColor(.yellow)
                    Text(item == 9 ? "更多" : "宝马X\(item)")
                        .font(.system(size: 13, weight: .light))
                }
                .padding(.top,5)
            }
        }
    }
}

struct TCCarBrandView_Previews: PreviewProvider {
    static var previews: some View {
        TCCarBrandView()
    }
}
