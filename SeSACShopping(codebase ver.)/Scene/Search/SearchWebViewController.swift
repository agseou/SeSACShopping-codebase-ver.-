//
//  saerchWebViewController.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/25.
//

import UIKit
import SnapKit
import WebKit

class SearchWebViewController: BaseViewController {

    let webView = WKWebView()
    var id: String = ""
    var productName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func configureHierarchy() {
        view.addSubview(webView)
    }
    
    override func configureView() {
        super.configureView()
        
        navigationItem.title = productName
        webView.load(URLRequest(url: URL(string: "https://msearch.shopping.naver.com/product/\(id)")!))
    }
    
    override func setupContsraints() {
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    

}
