//
//  MockData.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import Foundation


struct MockData {
    
    
    
    static let shared = MockData()
    
    private let selectCategory: ListSection = {
        .selectCategory([
               .init(title: "Phones", image: "mobile"),
               .init(title: "Computers", image: "comp"),
               .init(title: "Health", image: "heartSelect"),
               .init(title: "Books", image: "book"),
               .init(title: "Sport", image: "book"),
               .init(title: "Watches", image: "book"),
               .init(title: "Dogs", image: "book")
        ])
    }()
    
    private let search: ListSection = {
        .search([
               .init(title: "search", image: "imagename4")
        ])
    }()
    
    private let hotSales: ListSection = {
        .hotSales([
               .init(title: "Burger", image: "hotsales"),
               .init(title: "Chcken", image: "hotsales"),
               .init(title: "Hot-dog", image: "hotsales"),
               .init(title: "Pizza", image: "hotsales"),
               .init(title: "Taco", image: "hotsales"),
               .init(title: "Wok", image: "hotsales")
        ])
    }()
    
    
    private let bestSellers: ListSection = {
               .bestSellers([
                .init(title: "", image: "imagename3"),
               .init(title: "", image: "imagename3"),
                .init(title: "", image: "imagename3"),
               .init(title: "", image: "imagename3"),
                .init(title: "", image: "imagename3"),
               .init(title: "", image: "imagename3"),
                .init(title: "", image: "imagename3"),
               .init(title: "", image: "imagename3"),
               .init(title: "", image: "imagename3")
        
        ])
    }()
    
    
    
    var pageData: [ListSection] {
        [selectCategory,search,hotSales,bestSellers]
    }
    
    
    
    
}
