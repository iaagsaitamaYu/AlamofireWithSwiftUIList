//
//  models.swift
//  QiitaApiWithSwiftUIAlamofire
//
//  Created by 箭内雄 on 2023/09/16.
//

import Foundation
import Alamofire
struct QiitaApiModel:Codable ,Identifiable{
    let id = UUID()
    let title:String
    let user:User
    
    struct User:Codable {
        let name:String
    }
}


class GetQiitaData:ObservableObject {
    @Published var  qiitaModels:[QiitaApiModel] = []
    @Published var perPageNum = 30
    func fetchData() {
        AF.request("https://qiita.com/api/v2/items?per_page=\(String(perPageNum))").response {res in
            do {
                let decorder:JSONDecoder = JSONDecoder()
                let qiitaInfo:[QiitaApiModel] = try decorder.decode([QiitaApiModel].self, from: res.data!)
//                print(qiitaInfo)
                print(qiitaInfo.count)
                self.qiitaModels = qiitaInfo
            }catch {
                print(error.localizedDescription)
            }
        }
        
        
        
        
    }
    
    
}
