//
//  UsedCarHomePage.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/21.
//

import SwiftUI

struct TCHomePage: View {
    
    init() {
        UITableView.appearance().separatorStyle = UITableViewCell.SeparatorStyle.none
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        if #available(iOS 14.0, *)  {
            VStack(alignment:.center) {
                //顶部搜索条
                ZStack {
                    Image("bg_xc_ss")
                        .resizable()
                        .frame(height:35)
                    
                    TCSearchBarView()
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .background(Color.clear)
                }
                
                List {
                    
                    VStack {
                        VStack {
                            TCHomePageTopView()//糖豆
                            Spacer()
                                .frame(height:10)
                            HStack {
                                Spacer()
                                    .frame(width:5)
                                TCLookedView()//最近看过
                            }
                            Spacer()
                                .frame(height:10)
                        }
                        
                        VStack {
                            Spacer()
                                .frame(height:15)
                            TCCarTypeView()//车型
                            Spacer()
                                .frame(height:10)
                            TCCarBrandView()//品牌
                            Spacer()
                                .frame(height:15)
                        }
                        .background (
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.white)
                        )
                        
                        Spacer()
                            .frame(height:10)
                        TCCarTypeRecommendView()//车型推荐
                        Spacer()
                            .frame(height:10)
                        
                        VStack {
                            HStack {
                                Text("精选好车")
                                    .font(.headline)
                                Spacer()
                            }
                            .padding(.init(top: 18, leading: 10, bottom: 10, trailing: 0))
                            .frame(height:40)
                            Rectangle()
                                .foregroundColor(GrayColor_Line)
                                .frame(height:1)
                            Spacer()
                                .frame(height:8)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.white)
                        )
                    }
                    .listRowBackground(GrayColor_Back)
                    .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: -8, trailing: 10))
                    
                    ForEach(0..<15) { idx in
                        if idx == 0 || idx == 14 {
                            TCCarCell()
                                .background(
                                    RoundedRectangle(cornerRadius: 88, style: .continuous)
                                        .fill(Color.white)
                                )
                        } else {
                            TCCarCell()
                        }
                    }
                    .listRowBackground(GrayColor_Back)
                    .listRowInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                                .frame(height:8)
                            Text("查看全部车源 >")
                                .font(.system(size: 14, weight: .light))
                                .foregroundColor(GrayColor_Text)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color.white)
                    )
                    .listRowBackground(GrayColor_Back)
                    .listRowInsets(.init(top: -8, leading: 10, bottom: 0, trailing: 10))
                }
            }
            .background(GrayColor_Back)
            .ignoresSafeArea(.all, edges: .bottom)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct TCHomePage_Previews: PreviewProvider {
    static var previews: some View {
        TCHomePage()
    }
}
