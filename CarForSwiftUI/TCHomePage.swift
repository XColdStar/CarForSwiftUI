//
//  UsedCarHomePage.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/21.
//

import SwiftUI

class TCHomePageDatasModel: ObservableObject {
    //糖豆
    @Published var topDatas = [TCHomePageListChildren]()
    //车型
    @Published var carTypeDatas = [TCHomePageListChildren]()
    //品牌
    @Published var carBrandDatas = [TCHomePageListChildren]()
    //车型推荐
    @Published var carTypeRecommendDatas = [TCHomePageListChildren]()
}

struct TCHomePage: View {
    
    init() {
        UITableView.appearance().separatorStyle = UITableViewCell.SeparatorStyle.none
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
    }

    //存放首页所有数据模型
    @ObservedObject var datas = TCHomePageDatasModel()

    //最近看过数据源
    @EnvironmentObject var lookedManager: TCLookedManager
    
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
                            TCHomePageTopView(datas: $datas.topDatas)//糖豆
                            Group {
                                if lookedManager.lookedModels.count > 0 {
                                    Spacer()
                                        .frame(height:10)
                                    HStack {
                                        Spacer()
                                            .frame(width:5)
                                        TCLookedView()//最近看过
                                    }
                                }
                            }
                            Spacer()
                                .frame(height:10)
                        }
                        
                        VStack {
                            Spacer()
                                .frame(height:15)
                            TCCarTypeView(datas: $datas.carTypeDatas)//车型
                            Spacer()
                                .frame(height:10)
                            TCCarBrandView(datas: $datas.carBrandDatas)//品牌
                            Spacer()
                                .frame(height:15)
                        }
                        .background (
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color.white)
                        )
                        
                        Spacer()
                            .frame(height:10)
                        TCCarTypeRecommendView(datas: $datas.carTypeRecommendDatas)//车型推荐
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
            .onAppear (
                perform: getConfigDatas
            )
        } else {
            // Fallback on earlier versions
        }
    }
    
    func getConfigDatas() {
        TCHomePageRequest.getConfigDatas {(isSuccess, array, error) in
            if isSuccess {
                if let datas = array {
                    for (_, item) in datas.enumerated() {
                        switch item.typeId {
                        case "1": self.datas.topDatas = item.list ?? []
                        case "2": self.datas.carTypeDatas = item.list ?? []
                        case "3": self.datas.carTypeDatas += item.list ?? []
                        case "4": do {
                            self.datas.carBrandDatas = item.list ?? []
                            if self.datas.carBrandDatas.count > 0 {
                                let more = TCHomePageListChildren(data: "0", image: "ellipsis.circle.fill", subTitle: "", title: "更多")
                                self.datas.carBrandDatas.append(more)
                            }
                        }
                        case "5":self.datas.carTypeRecommendDatas = item.list ?? []
                        default: break
                        }
                    }
                } else {
                    print("空数据~")
                }
            } else {
                print("请求失败~：\(String(describing: error))")
            }
        }
    }
    
}

struct TCHomePage_Previews: PreviewProvider {
    static var previews: some View {
        TCHomePage()
    }
}
