//
//  TCLookedManager.swift
//  CarForSwiftUI
//
//  Created by cynfenghanxing on 2020/12/29.
//

import Foundation

let cachePath: NSString? = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .allDomainsMask, true).first as NSString?

class TCLookedManager: ObservableObject {
    
    var filePath: String = {
        guard cachePath != nil else{ return "" }
        let path = cachePath!.appendingPathComponent("TCLookedDatas")
        return path
    }()
    
    @Published var lookedModels = [TCHomeLookedModel]()
    
    init() { lookedModels = getLookedDatas() }
    
    //保存
    func save(model: TCHomeLookedModel) {
        let tempArray = lookedModels
        _ = tempArray.enumerated().map { index, item in
            if item.data == model.data || item.title == model.title {
                lookedModels.remove(at: index)
            }
        }
        if lookedModels.count >= 10 {
            lookedModels.removeLast()
        }
        lookedModels.insert(model, at: 0)
        DispatchQueue.global().async {
            let queue = DispatchQueue(label: "sync")
            queue.sync {
                do {
                    try NSKeyedArchiver.archivedData(withRootObject: self.lookedModels, requiringSecureCoding: false).write(to: URL(fileURLWithPath: self.filePath), options: .atomicWrite)
                } catch { }
            }
        }
    }
    
    //获取
    func getLookedDatas() -> [TCHomeLookedModel] {
        do {
            let models = try NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: TCHomeLookedModel.self, from: Data(contentsOf: URL(fileURLWithPath: self.filePath)))
            return models ?? []
        } catch  {
            return []
        }
    }
}
