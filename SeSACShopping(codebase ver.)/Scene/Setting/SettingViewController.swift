//
//  SettingViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/28.
//

import UIKit
import SnapKit

class SettingViewController: BaseViewController {

    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let list: [String] = ["공지사항", "자주 묻는 질문", "1:1 문의", "알림 설정", "처음부터 시작하기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func configureHierarchy() {
        view.addSubview(tableView)
        
    }
    
    override func configureView() {
        navigationItem.title = "설정"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "profileCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
    }
    
    override func setupContsraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            cell = UITableViewCell(style: .default, reuseIdentifier: "profileCell")
            cell.textLabel?.text = "떠나고 싶은 거지"
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
            cell.textLabel?.text = list[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 15)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == IndexPath(item: 0, section: 0) {
            let vc = ProfileNameViewController()
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath == IndexPath(item: 4, section: 1) {
            dismiss(animated: true)
        }
    }
    
}
