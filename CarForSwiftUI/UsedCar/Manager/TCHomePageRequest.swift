//
//  TCHomePageRequest.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/24.
//

import Foundation

struct TCHomePageRequest {
    
    //获取二手车首页糖豆、价格/车型筛选、品牌logo、”城市代步......等数据“）
    static func getConfigDatas(resultCallback: @escaping (Bool, [TCHomePageList]?, NSError?)->()) {
        TCReqest.request(url: "usedcar/api/home/v2/index", method: .get, param: nil) { (isSuccess, resultJson, error) in
            if isSuccess {
                let list = resultJson!["list"].arrayValue
                var array = [TCHomePageList]()
                for item in list {
                    if let model = TCHomePageList.deserialize(from: item.rawString()) {
                        array.append(model)
                    }
                }
                resultCallback(true,array,nil)
            } else {
                resultCallback(false,nil,error)
            }
        }
    }
    
    //获取精选好车
    static func getSelectGoodCars(param: [String : Any], resultCallback: @escaping (Bool, [TCSelectGoodCarModel]?, NSError?)->()) {
        TCReqest.request(url: "usedcar/api/home/choicegood", method: .get, param: param) { (isSuccess, resultJson, error) in
            if isSuccess {
                let list = resultJson!["list"].arrayValue
                var array = [TCSelectGoodCarModel]()
                for item in list {
                    if let model = TCSelectGoodCarModel.deserialize(from: item.rawString()) {
                        array.append(model)
                    }
                }
                resultCallback(true,array,nil)
            } else {
                resultCallback(false,nil,error)
            }
        }
    }
}
