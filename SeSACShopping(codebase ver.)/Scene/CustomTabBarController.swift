//
//  CustomTabBarController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/25.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstNavController = CustomNavigationController(rootViewController: SearchViewController())
        let secondNavController = CustomNavigationController(rootViewController: SettingViewController())
        
        // 탭 바 아이템 설정
        firstNavController.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "firstIcon"), tag: 0)
        secondNavController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(named: "secondIcon"), tag: 1)
        
        self.viewControllers = [firstNavController, secondNavController]
    }
}
