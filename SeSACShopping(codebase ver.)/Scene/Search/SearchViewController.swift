//
//  SearchViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/28.
//

import UIKit
import SnapKit

class SearchViewController: BaseViewController {

    let searchBar = UISearchBar()
    let tableView = UITableView()
    let EmptyImageView = UIImageView(image: UIImage(resource: .empty))
    var searchList: [String] = [] {
        didSet {
            EmptyImageView.isHidden = searchList.isEmpty ? false : true
            tableView.isHidden = !searchList.isEmpty ? false : true
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboard()
    }
    
    override func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(EmptyImageView)
    }
    
    override func configureView() {
        super.configureView()
        
        navigationItem.title = "\(UserDefaultsManager.shared.nickName)님의 새싹 쇼핑"
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchHistoryTableViewCell.self, forCellReuseIdentifier: "SearchHistoryTableViewCell")
        
        EmptyImageView.contentMode = .scaleAspectFit
    }
    
    override func setupContsraints() {
        searchBar.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        [tableView, EmptyImageView].forEach{ 
            $0.snp.makeConstraints {
                $0.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
                $0.top.equalTo(searchBar.snp.bottom)
            }
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       let vc = SearchDetailViewController()
       vc.searchKeyword = searchBar.text!
       navigationController?.pushViewController(vc, animated: true)
        searchList.insert(searchBar.text!, at: 0)
         searchBar.text = nil
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchHistoryTableViewCell", for: indexPath) as! SearchHistoryTableViewCell
        
        cell.selectionStyle = .none
        cell.searchLabel.text = searchList[indexPath.row]
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(tapDeleteBtn), for: .touchUpInside)
        
        return cell
    }
    
    @objc func tapDeleteBtn(_ sender: UIButton) {
        searchList.remove(at: sender.tag)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SearchDetailViewController()
        vc.searchKeyword = searchList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
