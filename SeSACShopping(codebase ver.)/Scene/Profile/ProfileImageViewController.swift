//
//  ProfileImageViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/28.
//

import UIKit
import SnapKit

class ProfileImageViewController: BaseViewController {
    
    let profileImage = ProfileButton()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionView())
    var selectedImage: Int {
        get {
            return UserDefaults.standard.integer(forKey: "profile")
        }
        set {
            UserDefaults.setValue(newValue, forKey: "profile")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureHierarchy() {
        view.addSubview(profileImage)
        view.addSubview(collectionView)
    }
    
    override func configureView() {
        profileImage.highlightBorderStyle()
        
        collectionView.register(ProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileImageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setupContsraints() {
        profileImage.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.size.equalTo(100)
        }
        collectionView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(profileImage.snp.bottom).offset(50)
        }
    }
    
    static func configureCollectionView() -> UICollectionViewLayout{
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width/4
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
}

extension ProfileImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileImageCollectionViewCell", for: indexPath) as! ProfileImageCollectionViewCell
        
        let profileImage = indexPath.item + 1
        cell.profileImageCell.setImage(UIImage(named: "profile\(indexPath.item + 1)"), for: .normal)
        if profileImage == selectedImage {
            cell.profileImageCell.highlightBorderStyle()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImage = indexPath.item + 1
    }
    
}
