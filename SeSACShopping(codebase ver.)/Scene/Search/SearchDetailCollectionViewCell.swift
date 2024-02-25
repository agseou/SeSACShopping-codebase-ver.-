//
//  SearchDetailCollectionViewCell.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/24.
//

import UIKit
import SnapKit

class SearchDetailCollectionViewCell: BaseCollectionViewCell {
    
    let productImage = UIImageView()
    let heartBtn = UIButton()
    let stackView = UIStackView()
    let productShop = UILabel()
    let productName = UILabel()
    let productPrice = UILabel()
    
    override func configureHierarchy() {
        contentView.addSubview(productImage)
        productImage.addSubview(heartBtn)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(productShop)
        stackView.addArrangedSubview(productName)
        stackView.addArrangedSubview(productPrice)
    }
    
    override func configureView() {
        productImage.layer.cornerRadius = 15
        productImage.backgroundColor = .gray
        
        heartBtn.backgroundColor = .white
        heartBtn.contentEdgeInsets = .init(top: 4, left: 4, bottom: 4, right: 4)
        heartBtn.tintColor = .black
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        heartBtn.setImage(UIImage(systemName: "heart", withConfiguration: config), for: .normal)
        DispatchQueue.main.async {
            self.heartBtn.layer.cornerRadius = self.heartBtn.bounds.width/2
        }
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        productShop.text = "shop"
        
        productName.text = "product"
        
        productPrice.text = "1000000"
    }
    
    override func setupContsraints() {
        productImage.snp.makeConstraints {
            $0.horizontalEdges.equalTo(contentView).inset(10)
            $0.height.equalTo(productImage.snp.width)
        }
        heartBtn.snp.makeConstraints {
            $0.bottom.equalTo(productImage).inset(10)
            $0.right.equalTo(productImage).inset(10)
        }
        stackView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalTo(contentView).inset(10)
            $0.top.equalTo(productImage.snp.bottom).offset(5)
        }
    }
}
