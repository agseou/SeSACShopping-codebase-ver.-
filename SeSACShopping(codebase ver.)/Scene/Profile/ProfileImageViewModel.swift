//
//  ProfileImageViewModel.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/25.
//

import Foundation

class ProfileImageViewModel {
    
    var inputProfileCellTapped: Observable<Int?> = Observable(nil)
    var outputProfileIndex: Observable<Int> = Observable(Int.random(in: 0...13) + 1)
    
    init() {
        inputProfileCellTapped.bind { indexItem in
            guard let indexItem else { return }
            self.outputProfileIndex.value = indexItem + 1
        }
    }
    
    private func selectImage(_ text: String) {
        
        
    }
    
}
