//
//  MainModel.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 14.12.22.
//

import Foundation
import Combine

final class MainViewModel {
    
    var basketService: BasketServiceProtocol
    var mainService: MainServiceProtocol
    var productService: ProductServiceProtocol
    
    init(basketService: BasketServiceProtocol, mainService: MainServiceProtocol, productService: ProductServiceProtocol) {
        self.basketService = basketService
        self.mainService = mainService
        self.productService = productService
        
        
    
    }
    
    
    
    
}
