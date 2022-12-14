//
//  BasketEntitie.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation

// MARK: - BasketEntitie
struct BasketEntitie: Codable {
    var basket: [Products]
    let delivery, id: String
    let total: Int
}

// MARK: - Basket
struct Products: Codable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}
