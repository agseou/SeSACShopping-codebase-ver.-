//
//  SearchHistoryTableViewCell.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/24.
//

import UIKit
import SnapKit

class SearchHistoryTableViewCell: BaseTableViewCell {

    let circleView = UIView()
    let magnifyingglassImage = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    let searchLabel = UILabel()
    let deleteBtn = UIButton()
    
    override func configureHierarchy() {
        contentView.addSubview(circleView)
        circleView.addSubview(magnifyingglassImage)
        contentView.addSubview(searchLabel)
        contentView.addSubview(deleteBtn)
    }
    
    override func configureView() {
        DispatchQueue.main.async {
            self.circleView.layer.cornerRadius = self.circleView.bounds.width / 2
        }
        circleView.layer.borderColor = UIColor.white.cgColor
        circleView.layer.borderWidth = 0.5
        
        magnifyingglassImage.tintColor = .white
        
        searchLabel.text = "What did I search for?"
        
        deleteBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        deleteBtn.tintColor = .white
    }
    
    override func setupContsraints() {
        circleView.snp.makeConstraints {
            $0.verticalEdges.equalTo(contentView).inset(10)
            $0.left.equalTo(contentView).offset(10)
            $0.size.equalTo(36)
        }
        magnifyingglassImage.snp.makeConstraints {
            $0.edges.equalTo(circleView).inset(6)
        }
        searchLabel.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.left.equalTo(contentView).offset(60)
        }
        deleteBtn.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.right.equalTo(contentView).offset(-10)
        }
    }

}
