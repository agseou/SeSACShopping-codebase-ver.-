//
//  SearchDetailViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/24.
//

import UIKit
import SnapKit
import Kingfisher

class SearchDetailViewController: BaseViewController {

    let shoppingManager = ShoppingAPIManager()
    var searchKeyword: String = ""
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionView())
    var searchResultList: [Item] = [] {
        didSet { collectionView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shoppingManager.callRequest(text: searchKeyword, sort: "sim") { Shopping in
            self.searchResultList.append(contentsOf: Shopping.items)
        }
    }
    
    override func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    override func configureView() {
        super.configureView()
        
        navigationItem.title = searchKeyword
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SearchDetailCollectionViewCell.self, forCellWithReuseIdentifier: "SearchDetailCollectionViewCell")
    }
    
    override func setupContsraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    static func configureCollectionView() -> UICollectionViewLayout{
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width/2
        let height = UIScreen.main.bounds.height/3
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
}

extension SearchDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResultList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchDetailCollectionViewCell", for: indexPath) as! SearchDetailCollectionViewCell
        
        let item = searchResultList[indexPath.item]
        
        cell.productName.text = item.title
        cell.productPrice.text = item.hprice
        cell.productShop.text = item.mallName
        cell.productImage.kf.setImage(with: URL(string: item.image))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = SearchWebViewController()
        vc.id = searchResultList[indexPath.item].productId
        vc.productName = searchResultList[indexPath.item].title
        navigationController?.pushViewController(vc, animated: true)
    }
}
