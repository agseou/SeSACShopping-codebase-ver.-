//
//  ProfileImageViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/28.
//

import UIKit
import SnapKit

class ProfileImageViewController: UIViewController {
    
    let profileImage = ProfileButton()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionView())

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        setupContsraints()
    }
    

}

extension ProfileImageViewController: ConfigurableView {
    func configureHierarchy() {
        view.addSubview(profileImage)
        view.addSubview(collectionView)
    }
    
    func configureView() {
        collectionView.register(ProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileImageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupContsraints() {
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
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/4 - 15, height: 100)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        return layout
    }
    
    
}

extension ProfileImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileImageCollectionViewCell", for: indexPath) as! ProfileImageCollectionViewCell
        
        return cell
    }
    
    
}

#Preview {
    ProfileImageViewController()
}
