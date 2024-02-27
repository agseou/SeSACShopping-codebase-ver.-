//
//  SearchViewModel.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/26.
//

import Foundation

class SearchViewModel {
    
    // 검색 기록 리스트
    var searchHistoryList: Observable<[String?]> = Observable([])
    
    // 검색 실행 -> TextField에서 return 눌렀을 때
    var inputSearchText: Observable<String?> = Observable(nil)
    
    init() { transfrom() }
    
    private func transfrom() {
        
        inputSearchText.bind { text in
            // 들어온 값이 빈값인지 확인
            guard let text = text, !text.isEmpty else { return }
            if !self.searchHistoryList.value.contains(text) {
                
            }
            
        }
        
    }
    
}
