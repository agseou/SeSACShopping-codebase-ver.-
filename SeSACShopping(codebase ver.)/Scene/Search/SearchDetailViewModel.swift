//
//  SearchDetailViewModel.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/27.
//

import Foundation

class SearchDetailViewModel {
    
    let shoppingAPI = ShoppingAPIManager()
    
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    var outputData: Observable<[Item]> = Observable([])
    
    init() {
        print("ViewModel Init")
        inputViewDidLoadTrigger.bind { _ in
            shoppingAPI.callRequest(text: "", sort: "sim") { data in
                outputData.value = data
            }
        }
    }
    
    
}
