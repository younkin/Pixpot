//
//  BasketApiClient.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import Combine

protocol BasketApiClientProtocol {
    func getBasket() -> AnyPublisher<BasketEntitie, Error>
}

extension APIClient: BasketApiClientProtocol {
    func getBasket() -> AnyPublisher<BasketEntitie, Error> {
        let request = requestBuilder
            .set(path: .cart)
            .set(method: .GET)
            .build()
        return performRequest(request)
    }
    
}
