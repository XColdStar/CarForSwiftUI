//
//  TCHomePageTopView.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/21.
//

import SwiftUI

struct Data: Identifiable {
    var id = UUID()
    var name: String = ""
    var imgName: String = ""
    init(name: String , imgName: String) {
        self.name = name
        self.imgName = imgName
    }
}

struct TCHomePageTopView: View {
    
    var datas: Array<Data> {
        [Data(name: "晴朗", imgName: "sun.min"),
         Data(name: "小雨", imgName: "cloud.drizzle"),
         Data(name: "大雾", imgName: "cloud.fog"),
         Data(name: "大雪", imgName: "cloud.snow"),
         Data(name: "晚上", imgName: "moon"),
        ]
    }
    
    var body: some View {
        let rows: [GridItem] = Array(repeating: GridItem(), count: 1)
        LazyHGrid(rows: rows, alignment: .center) {
            ForEach(datas) {data in
                VStack {
                    Spacer()
                        .frame(height:5)
                    
                    Image(systemName: data.imgName)
                        .resizable()
                        .frame(width:30, height:30)
                        .foregroundColor(.yellow)
                    
                    Spacer()
                        .frame(height:15)
                    
                    Text(data.name)
                        .font(.system(size: 13, weight: .light))
                }
                .frame(width:(DeviceWidth-80)/5.0)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .frame(width: DeviceWidth-20,height: 100)
//        .shadow(radius: 5)
    }
}

struct TCHomePageTopView_Previews: PreviewProvider {
    static var previews: some View {
        TCHomePageTopView()
    }
}
