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
    
    var basketSubject = CurrentValueSubject<BasketEntitie, Error>(BasketEntitie(basket: [], delivery: "Free", id: "0", total: 0))
    
    init(apiClient: BasketApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getBasket() -> AnyPublisher<BasketEntitie, Error> {
       return  apiClient.getBasket()
            .map { [weak self] basket in
                self?.basketSubject.send(basket)
                return basket
            }
            .eraseToAnyPublisher()
    }
}
