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
    //精选好车
    @Published var selectGoodCarDatas = [TCSelectGoodCarModel]()
}

struct TCHomePage: View {
    
    init() {
        UITableView.appearance().separatorStyle = UITableViewCell.SeparatorStyle.none
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
        getConfigDatas()
        getSelectGoodCarListData()
    }

    //存放首页所有数据模型
    @ObservedObject var datas = TCHomePageDatasModel()

    //最近看过数据源
    @EnvironmentObject var lookedManager: TCLookedManager
    
    var body: some View {
        if #available(iOS 14.0, *)  {
            NavigationView {
                VStack(alignment:.center) {
                    
                    //顶部搜索条
                    ZStack {
                        Image("bg_xc_ss")
                            .resizable()
                            .frame(height:35)
                        
                        TCSearchBarView()
                    }

                    List {
                        
                        //header
                        VStack(alignment: .center) {
                            
                            //糖豆
                            TCHomePageTopView(datas: $datas.topDatas)

                            //最近看过
                            if lookedManager.lookedModels.count > 0 {
                                Spacer()
                                    .frame(height:10)
                                HStack {
                                    Spacer()
                                        .frame(width:10)
                                    TCLookedView()
                                    Spacer()
                                        .frame(width:10)
                                }
                            }
                            
                            Spacer()
                                .frame(height:10)
                            
                            VStack {
                                Spacer()
                                    .frame(height:15)
                                TCCarTypeView(datas: $datas.carTypeDatas)//车型（5万以下...SUV...）
                                Spacer()
                                    .frame(height:10)
                                TCCarBrandView(datas: $datas.carBrandDatas)//品牌（大众...）
                                Spacer()
                                    .frame(height:15)
                            }
                            .background (
                                RoundedRectangle(cornerRadius: 8, style: .circular)
                                    .fill(Color.white)
                            )
                            .frame(width:DeviceWidth-20)
                            
                            //车型推荐（城市代步）
                            Spacer()
                                .frame(height:10)
                            TCCarTypeRecommendView(datas: $datas.carTypeRecommendDatas)
                            Spacer()
                                .frame(height:10)
                            
                            //精选好车
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
                            .frame(width:DeviceWidth-20)
                            .background(
                                RoundedRectangle(cornerRadius: 8, style: .circular)
                                    .fill(Color.white)
                            )
                        }
                        .listRowBackground(GrayColor_Back)
                        .listRowInsets(EdgeInsets(.init(top: 0, leading: 0, bottom: -8, trailing: 0)))
                        
                        ForEach(self.datas.selectGoodCarDatas) { item in
                            let idx = self.datas.selectGoodCarDatas.firstIndex(of: item)
                            if idx == 0 || idx == 14 {
                                TCCarCell(model: item)
                                    .background(
                                        RoundedRectangle(cornerRadius: 88, style: .circular)
                                            .fill(Color.white)
                                    )
                            } else {
                                TCCarCell(model: item)
                            }
                        }
                        .listRowBackground(GrayColor_Back)
                        .listRowInsets(EdgeInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 10)))
                        
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
                            RoundedRectangle(cornerRadius: 8, style: .circular)
                                .fill(Color.white)
                        )
                        .listRowBackground(GrayColor_Back)
                        .listRowInsets(.init(top: -8, leading: 10, bottom: 0, trailing: 10))
                    }
                    .listStyle(PlainListStyle())
                }
                .frame(width: DeviceWidth, alignment: .top)
                .background(GrayColor_Back)
                .navigationBarHidden(true)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    //获取首页列表header相关数据
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
    
    //获取精选好车列表数据
    func getSelectGoodCarListData() {
        let param: [String : Any] = ["cityid":201,"sign":"9a1bc497ebb9c9d95cb7710e1fbe3a3d"]
        TCHomePageRequest.getSelectGoodCars(param: param) { (isSuccess, array, error) in
            if isSuccess {
                if let datas = array {
                    self.datas.selectGoodCarDatas = datas
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
