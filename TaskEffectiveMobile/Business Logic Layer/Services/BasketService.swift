//
//  BasketService.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import Combine

protocol BasketServiceProtocol {
    func getBasket() -> AnyPublisher<BasketEntitie, Error>
}

final class BasketService: BasketServiceProtocol {
    
    var apiClient: BasketApiClientProtocol
    
    init(apiClient: BasketApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getBasket() -> AnyPublisher<BasketEntitie, Error> {
       return  apiClient.getBasket()
            .eraseToAnyPublisher()
    }
}
