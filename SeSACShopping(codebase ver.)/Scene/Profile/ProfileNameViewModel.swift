//
//  ProfileNameViewModel.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/24.
//

import Foundation

class ProfileNameViewModel {
    
    // 닉네임
    var inputName = Observable("")
    var outputName = Observable("")
    
    // 버튼 활성화 여부
    var isActiveButton = Observable(false)
    
    init() {
        inputName.bind { value in
            self.isvalidatedName(value)
        }
    }
    
    // 이름이 유효한지 검사하는 함수
    private func isvalidatedName(_ text: String){
        // 1. 빈값 검사
        if text.isEmpty {
            outputName.value = "닉네임을 입력해주세요 :)"
            isActiveButton.value = false
            return
        }
        
        // 2. 숫자 포함 여부 검사
        let containNumberRegex = ".*[0-9]+.*"
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", containNumberRegex)
        if numberPredicate.evaluate(with: text) {
            outputName.value = "닉네임에 숫자는 사용할 수 없어요"
            isActiveButton.value = false
            return
        }
        
        // 2. 특수문자 포함 여부 검사
        let containsSpecialCharacterRegex = ".*[^a-zA-Z가-힣].*"
        let specialCharacterPredicate = NSPredicate(format: "SELF MATCHES %@", containsSpecialCharacterRegex)
        if specialCharacterPredicate.evaluate(with: text) {
            outputName.value = "닉네임에 특수문자는 사용할 수 없어요"
            isActiveButton.value = false
            return
        }
        
        // 3. 글자수 검사 : 2글자 이상 10글자 미만
        if text.count < 1 || text.count > 10 {
            outputName.value = "2글자 이상 10글자 미만으로 설정해주세요."
            isActiveButton.value = false
            return
        }
        
        outputName.value = "\(text)은(는) 가능해요!"
        isActiveButton.value = true
    }
}
