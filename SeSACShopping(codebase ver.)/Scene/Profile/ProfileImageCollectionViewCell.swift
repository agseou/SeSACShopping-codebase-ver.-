//
//  ProfileImageCollectionViewCell.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/30.
//

import UIKit
import SnapKit

class ProfileImageCollectionViewCell: BaseCollectionViewCell {
    
    var profileImageCell = ProfileButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        contentView.addSubview(profileImageCell)
    }
    
    override func configureView() {
        profileImageCell.isUserInteractionEnabled = false
    }
    
    override func setupContsraints() {
        profileImageCell.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide).inset(5)
            $0.width.equalTo(profileImageCell.snp.height)
        }
    }
}
