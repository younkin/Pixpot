//
//  ProductApiClient.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import Combine

protocol ProductApiClientProtocol {
    func getProduct() -> AnyPublisher<ProductEntitie, Error>
}

extension APIClient: ProductApiClientProtocol {
    func getProduct() -> AnyPublisher<ProductEntitie, Error> {
        let request = requestBuilder
            .set(path: .product)
            .set(method: .GET)
            .build()
        return performRequest(request)
    }
    
}
