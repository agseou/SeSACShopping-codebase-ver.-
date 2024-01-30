//
//  ProfileImageCollectionViewCell.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/30.
//

import UIKit
import SnapKit

class ProfileImageCollectionViewCell: UICollectionViewCell {
    
    var profileImageCell = ProfileButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureCell()
        setupContsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        self.addSubview(profileImageCell)
    }
    
    private func configureCell() {
        // 왜 안될까?
        profileImageCell.highlightBorderStyle()
    }
    
    private func setupContsraints() {
        profileImageCell.snp.makeConstraints {
            $0.edges.equalTo(contentView)
            $0.size.equalTo(100)
        }
    }
}
