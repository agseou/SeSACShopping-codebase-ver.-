//
//  ProfileNameViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/28.
//

import UIKit
import SnapKit

class ProfileNameViewController: UIViewController {
    
    let editProfileButton = ProfileButton()
    let overlayIcon = UIImageView(image: UIImage(resource: .camera))
    let nameTextField = UITextField()
    let divider = UIView()
    let noticeLabel = UILabel()
    let completeButton = WideButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        setupContsraints()
    }
    

}

extension ProfileNameViewController: ConfigurableView {
    func configureHierarchy() {
        view.addSubview(editProfileButton)
        view.addSubview(overlayIcon)
        view.addSubview(nameTextField)
        view.addSubview(divider)
        view.addSubview(noticeLabel)
        view.addSubview(completeButton)
    }
    
    func configureView() {
        //editProfileButton.im
        nameTextField.borderStyle = .none
        nameTextField.placeholder = "닉네임을 입력해주세요:)"
        
        divider.backgroundColor = .accent
        
        noticeLabel.textColor = .accent
        noticeLabel.text = "닉네임에 특수문자는 들어갈 수 없어요."
        
        completeButton.setTitle("완료", for: .normal)
    }
    
    func setupContsraints() {
        editProfileButton.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(100)
            $0.size.equalTo(100)
        }
        overlayIcon.snp.makeConstraints {
            $0.bottom.equalTo(editProfileButton.snp.bottom).offset(-10)
            $0.trailing.equalTo(editProfileButton.snp.trailing).offset(-10)
        }
        
        nameTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(editProfileButton.snp.bottom).offset(30)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        divider.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        noticeLabel.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(divider.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        completeButton.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(noticeLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }
    
    
}

#Preview {
    ProfileNameViewController()
}
