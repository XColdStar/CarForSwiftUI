//
//  TCCarTypeView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/22.
//

import SwiftUI

struct TCCarTypeView: View {
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.fixed((DeviceWidth-70)/4.0)), count: 4)
        LazyVGrid(columns: columns,spacing:10) {
            ForEach(0..<8) { item in
                Text("\(item + 1)-\(item + 2)万")
                    .padding(.init(top: 5, leading: 20, bottom: 5, trailing: 20))
                    .font(.system(size: 13, weight: .light))
                    .background (
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(BlueColor_Back)
                    )
            }
        }
//        .background(Color.blue)
        .fixedSize()
    }
}

struct TCCarTypeView_Previews: PreviewProvider {
    static var previews: some View {
        TCCarTypeView()
    }
}
