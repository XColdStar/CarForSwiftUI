//
//  TCCarCell.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/23.
//

import SwiftUI

struct TCCarCell: View {
    
    let model: TCSelectGoodCarModel
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height:10)
            HStack(alignment: .top) {
//                Image(systemName: "car")
//                    .resizable()
//                    .frame(width: DeviceWidth/3.0,height: 90)
//                    .foregroundColor(.yellow)
//                    .background (
//                        RoundedRectangle(cornerRadius: 8, style: .circular)
//                            .fill(Color.white)
//                    )
                
//                ImageView(imageUrl: model.image ?? "", imageSize: CGSize(width: 114, height: 76))
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 114, height: 76)
//                    .clipped()
//                    .cornerRadius(8)

                NetworkImage(url: model.image ?? "",
                        placeholder: Image("async105x70"),
                          imageSize: CGSize(width: 114, height: 76),
                      cornerRadius: 8)
                    .frame(width: 114, height: 76, alignment: .center)
                
                Spacer()
                    .frame(width:15)
                
                VStack(alignment:.leading) {
                    
                    if let year = model.year {
                        Text((model.serialName ?? "") + "\(year)款" + (model.carName ?? ""))
                            .font(.subheadline)
                    } else {
                        Text((model.serialName ?? "") + (model.carName ?? ""))
                            .font(.subheadline)
                    }

                    if (model.labels?.count)! > 0 {
                        Spacer()
                            .frame(height:5)
                        Text(model.labels!)
                            .font(.system(size: 10, weight: .light))
                            .foregroundColor(.blue)
                            .padding(.all,2)
                            .background(
                                RoundedRectangle(cornerRadius:3, style: .circular)
                                    .fill(BlueColor_Back)
                            )
                    }
                    
                    Spacer()
                        .frame(height:5)
                    
                    if let year = model.year {
                        Text("\(String(format: "%d", year))年/\(String(format: "%.2f", model.mileage!/10000.0))万公里/\(model.cityName ?? "")")
                            .font(.system(size: 11, weight: .light))
                    } else {
                        Text("\(String(format: "%.2f", model.mileage!/10000.0))万公里/\(model.cityName ?? "")")
                            .font(.system(size: 11, weight: .light))
                    }
                    
                    Spacer()
                        .frame(height:5)
                    
                    Text(model.displayPrice ?? "")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.red)
                    
                }
                Spacer()
            }
            Rectangle()
                .foregroundColor(GrayColor_Line)
                .frame(height:1)
        }
        .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
        .background(Color.white)
    }
}

//struct TCCarCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TCCarCell()
//    }
//}
