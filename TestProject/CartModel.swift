//
//  Product.swift
//  TestProject
//
//  Created by Paras Navadiya on 10/22/24.
//

import Foundation

struct CartModel: Codable{    
    let carts: [Cart]
    let total, skip, limit: Int
}


struct Cart: Codable  {
    let id: Int
    let products: [Product]
    let total, discountedTotal: Double
    let userId, totalProducts, totalQuantity: Int

    enum CodingKeys: String, CodingKey {
        case id, products, total, discountedTotal
        case userId
        case totalProducts, totalQuantity
    }
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let quantity: Int
    let total, discountPercentage, discountedTotal: Double
    let thumbnail: String
}
