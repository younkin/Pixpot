//
//  ProductService.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import Combine

protocol ProductServiceProtocol {
    func getProduct() -> AnyPublisher<ProductEntitie, Error>
}

final class ProductService: ProductServiceProtocol {
    
    var apiClient: ProductApiClientProtocol
    
    init(apiClient: ProductApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getProduct() -> AnyPublisher<ProductEntitie, Error> {
        return apiClient.getProduct()
            .eraseToAnyPublisher()
    }
}
