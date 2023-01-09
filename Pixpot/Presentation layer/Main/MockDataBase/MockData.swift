//
//  MockData.swift
//  Sarawan
//
//  Created by Евгений Юнкин on 23.12.22.
//

import Foundation

// временная локальная база, УДАЛИТЬ ПОСЛЕ ДОБАВЛЕНИЯ БЭКА
struct ListItem {
    let title: String
    let image: String
    
}


enum ListSection {
    case headSection([ListItem])
    case productSection([ListItem])

    
    
    
    var items: [ListItem] {
        switch self {
        case .headSection(let items),
             .productSection(let items):
            return items
            
            
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .headSection(_):
            return "headSection"
        case .productSection(_):
            return "productSection"
        }
    }
}



struct MockData {
    
    static let shared = MockData()
    
    private let headSection: ListSection = {
        .headSection([
               .init(title: "Еще выгоднее!", image: "catalogHeader"),
               .init(title: "Еще более", image: "catalogHeader"),
               .init(title: "Еще более более", image: "catalogHeader"),
               .init(title: "Более более", image: "catalogHeader")
        ])
    }()
    
    private let productSection: ListSection = {
        .productSection([
            .init(title: "категория", image: "Напитки"),
            .init(title: "категория", image: "Стирка"),
            .init(title: "категория", image: "Beautyful"),
            .init(title: "категория", image: "Bread"),
            .init(title: "категория", image: "Cooked"),
            .init(title: "категория", image: "deserts"),
            .init(title: "категория", image: "Fish"),
            .init(title: "категория", image: "Flour"),
            .init(title: "категория", image: "frozeFoods"),
            .init(title: "категория", image: "Healthy"),
            .init(title: "категория", image: "Kidswear"),
            .init(title: "категория", image: "Meat"),
            .init(title: "категория", image: "Milk,chees"),
            .init(title: "категория", image: "Muesli"),
            .init(title: "категория", image: "nuts"),
            .init(title: "категория", image: "Oil"),
            .init(title: "категория", image: "Pasta"),
            .init(title: "категория", image: "Petswear"),
            .init(title: "категория", image: "Sausage"),
            .init(title: "категория", image: "Season"),
            .init(title: "категория", image: "snacks"),
            .init(title: "категория", image: "TeaCoffee"),
            .init(title: "категория", image: "Vegetables")
        ])
    }()
    
    
    
    
    
    var pageData: [ListSection] {
        [headSection,productSection]
    }
    
    
    
    
}
