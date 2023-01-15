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
            .init(title: "", image: "BasketballHeader"),
            .init(title: "", image: "FootballHeader"),
            .init(title: "", image: "GymnasticsHeader"),
            .init(title: "", image: "MartialHeader"),
            .init(title: "", image: "RunningHeader"),
            .init(title: "", image: "SkiHeader"),
            .init(title: "", image: "SwimmingHeader"),
            .init(title: "", image: "VolleyHeader")
        ])
    }()
    
    private let productSection: ListSection = {
        .productSection([
            .init(title: "категория", image: "footballOnly"),
            .init(title: "категория", image: "footballOnly"),
            .init(title: "категория", image: "footballOnly"),
            .init(title: "категория", image: "footballOnly"),
            .init(title: "категория", image: "footballOnly"),
            .init(title: "категория", image: "footballOnly"),
            .init(title: "категория", image: "footballOnly"),
            .init(title: "категория", image: "footballOnly")
//            .init(title: "категория", image: "Basketball"),
//            .init(title: "категория", image: "Football"),
//            .init(title: "категория", image: "Gymnastics"),
//            .init(title: "категория", image: "Martial"),
//            .init(title: "категория", image: "Running"),
//            .init(title: "категория", image: "Ski"),
//            .init(title: "категория", image: "Swimming"),
//            .init(title: "категория", image: "Volley")
        ])
    }()
    
    
    
    
    
    var pageData: [ListSection] {
        [headSection,productSection]
    }
    
    
    
    
}
