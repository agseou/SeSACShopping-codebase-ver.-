//
//  ProfileNameViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/28.
//

import UIKit
import SnapKit

class ProfileNameViewController: BaseViewController {
    
    let viewModel = ProfileNameViewModel()
    
    let editProfileButton = ProfileButton()
    let overlayIcon = UIImageView(image: UIImage(resource: .camera))
    let nameTextField = UITextField()
    let divider = UIView()
    let noticeLabel = UILabel()
    let completeButton = WideButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.exceptionLabel.bind { value in
            self.noticeLabel.text = value
        }
        viewModel.isActiveButton.bind { value in
            self.completeButton.isEnabled = value
        }
        self.hideKeyboard()
    }
    
    override func configureHierarchy() {
        view.addSubview(editProfileButton)
        view.addSubview(overlayIcon)
        view.addSubview(nameTextField)
        view.addSubview(divider)
        view.addSubview(noticeLabel)
        view.addSubview(completeButton)
    }
    
    override func configureView() {
        super.configureView()
        
        navigationItem.title = "프로필 설정"
        
        editProfileButton.highlightBorderStyle()
        editProfileButton.addTarget(self, action: #selector(tapEditProfileButton), for: .touchUpInside)
        
        nameTextField.borderStyle = .none
        nameTextField.addTarget(self, action: #selector(changeTextField), for: .editingChanged)
        
        divider.backgroundColor = .accent
        
        noticeLabel.textColor = .accent
        
        completeButton.setTitle("완료", for: .normal)
        completeButton.addTarget(self, action: #selector(tapCompleteButton), for: .touchUpInside)
    }
    
    @objc func tapEditProfileButton() {
        let vc = ProfileImageViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func changeTextField() {
        guard let text = nameTextField.text else { return }
        viewModel.inputName.value = text
    }
    
    @objc func tapCompleteButton() {
        guard let text = nameTextField.text else { return }
        UserDefaultsManager.shared.nickName = text
        
        let vc = CustomTabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true) {
            UserDefaultsManager.shared.userState = true
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    override func setupContsraints() {
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
