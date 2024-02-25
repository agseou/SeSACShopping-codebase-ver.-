//
//  Shopping.swift
//  SeSACShopping(codebase ver.)
//
//  Created by 은서우 on 2024/02/24.
//

import Foundation

struct Shopping: Decodable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

struct Item: Codable {
    let title: String
    let link: String
    let image: String
    let lprice, hprice, mallName, productId: String
    let productType, brand, maker: String
}
