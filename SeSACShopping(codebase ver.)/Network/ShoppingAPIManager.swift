//
//  ShoppingAPIManager.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/24.
//

import Foundation
import Alamofire

class ShoppingAPIManager {
    
    let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                    "X-Naver-Client-Id": APIKey.clientID,
                    "X-Naver-Client-Secret": APIKey.clientSecret]
    
    func callRequest(text: String, sort: String, completionHandler: @escaping (Shopping) -> Void) {
        
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = "https://openapi.naver.com/v1/search/shop.json?query=\(query)&display=20&start=1&sort=\(sort)"
        
        let parameters: Parameters = [
                    "query": query
                ]
        
        AF.request(url,
                   method: .get,
                   parameters: parameters,
                   headers: headers).responseDecodable(of: Shopping.self) { response in
            
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
