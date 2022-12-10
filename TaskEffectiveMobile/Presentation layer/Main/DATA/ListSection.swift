//
//  ListSection.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import Foundation

enum ListSection {
    case selectCategory([ListItem])
    case search([ListItem])
    case hotSales([ListItem])
    case bestSellers([ListItem])
    
    
    
    var items: [ListItem] {
        switch self {
        case .selectCategory(let items),
                .search(let items),
                .hotSales(let items),
                .bestSellers(let items):
            return items
            
            
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .selectCategory(_):
            return "Select Category"
        case .hotSales(_):
            return "Hot sales"
        case .bestSellers(_):
            return "Best Sellers"
        case .search(_):
            return "Search"
        }
    }
}
