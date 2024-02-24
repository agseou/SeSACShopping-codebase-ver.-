//
//  CustomNavigationController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/24.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        let titleFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold)]
        navigationBar.titleTextAttributes = titleFontAttributes
    }
    
}

extension CustomNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // 네비게이션 스택에 2개 이상 VC가 있을 때 뒤로가기 버튼 설정
        if navigationController.viewControllers.count > 1 {
            let backBtn = UIButton()
            let config = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 17))
            backBtn.setImage(UIImage(systemName: "chevron.backward", withConfiguration: config), for: .normal)
            backBtn.tintColor = .white
            backBtn.addTarget(self, action: #selector(tapBackBtn), for: .touchUpInside)
            let backBtnItem = UIBarButtonItem(customView: backBtn)
            
            viewController.navigationItem.leftBarButtonItem = backBtnItem
        }
    }
    
    @objc func tapBackBtn() {
        popViewController(animated: true)
    }
}
