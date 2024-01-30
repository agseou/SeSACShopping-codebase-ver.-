//
//  OnboardingViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/01/28.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    let appLogo = UIImageView(image: UIImage(resource: .sesacShopping))
    let onboardingImage = UIImageView(image: UIImage(resource: .onboarding))
    let startBtn = WideButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureView()
        setupContsraints()
    }
   
}

extension OnboardingViewController: ConfigurableView {
    func configureHierarchy() {
        view.addSubview(appLogo)
        view.addSubview(onboardingImage)
        view.addSubview(startBtn)
        
    }
    
    func configureView() {
        startBtn.setTitle("시작하기", for: .normal)
    }
    
    func setupContsraints() {
        appLogo.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(100)
        }
        onboardingImage.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        startBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }
}

#Preview {
    OnboardingViewController()
}
