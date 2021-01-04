//
//  TCReqest.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/24.
//

import Foundation
import Alamofire
import SwiftyJSON

let host = "https://bj.app.yiche.com/"

struct TCReqest  {
    
    static func request(url: String, method: HTTPMethod, param: [String: Any]?, resultCallback: @escaping (Bool, JSON?, NSError?)->()) {
        let requestUrl = host + url
        print("requestUrl：\(requestUrl)")
        AF.request(requestUrl, method: method, parameters: param).responseJSON { response in
            
            guard response.error == nil else {
                let error = NSError(domain: response.error?.errorDescription ?? "请求失败！", code: response.error!.responseCode ?? 0, userInfo: nil)
                return resultCallback(false,nil,error)
            }
            
            guard response.value != nil else {
                let error = NSError(domain: "数据为空！", code: 0, userInfo: nil)
                return resultCallback(false,nil,error)
            }
            
            let json = JSON(response.value!)
            let status =  json["Status"].rawString()
            
            guard status == "2" else {
                let error = NSError(domain: json["Message"].rawString() ?? "失败！", code: Int(status ?? "0") ?? 0, userInfo: nil)
                return resultCallback(false,nil,error)
            }
        
            resultCallback(true, json["Data"] , nil)
        }
    }
    
}
