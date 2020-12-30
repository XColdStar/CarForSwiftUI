//
//  TCLookedView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/22.
//

import SwiftUI

struct TCLookedView: View {
    
    @EnvironmentObject var lookedManager: TCLookedManager
    
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack {
                Text("最近看过:")
                    .font(.subheadline)
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(lookedManager.lookedModels) { item in
                            Text(item.title ?? "")
                                .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .font(.system(size: 13, weight: .light))
                                .background(
                                    RoundedRectangle(cornerRadius: 13, style: .continuous)
                                        .fill(Color.white)
                                )
                        }
                    }
                }
            }
            HStack {
                RoundedRectangle(cornerRadius: 0)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: 0xFFFFFF, alpha: 0.3),Color(hex: 0xFFFFFF, alpha: 0.5),Color(hex: 0xF5F7FB, alpha: 0.8)]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: 10, height: 25, alignment: .trailing)
            }
        }
//        .background(Color.gray)
    }
}

struct TCLookedView_Previews: PreviewProvider {
    static var previews: some View {
        TCLookedView()
    }
}
