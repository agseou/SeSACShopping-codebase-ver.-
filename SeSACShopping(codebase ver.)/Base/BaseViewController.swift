//
//  BaseViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        setupContsraints()
    }

    func configureHierarchy() { }
    func configureView() { }
    func setupContsraints() { }
}
