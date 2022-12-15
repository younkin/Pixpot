//
//  ProductViewModel.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 14.12.2022.
//

import Foundation
import Combine

final class ProductViewModel {
    
    private var productService: ProductServiceProtocol?
    
    init(service: ProductServiceProtocol) {
        self.productService = service
    }
}
