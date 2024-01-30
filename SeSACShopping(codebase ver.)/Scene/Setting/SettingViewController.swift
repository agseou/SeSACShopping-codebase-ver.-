//
//  SettingViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/28.
//

import UIKit

class SettingViewController: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        setupContsraints()
    }
    
}

extension SettingViewController: ConfigurableView {
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupContsraints() {
        
    }
    
    
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
    
    
}
