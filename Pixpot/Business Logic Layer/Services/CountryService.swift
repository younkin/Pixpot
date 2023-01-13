//
//  CountryService.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 13.01.23.
//

import Foundation
import Combine

protocol CountryServiceProtocol {
    func getCountry() -> AnyPublisher<CountryEntitie, Error>

}

final class CountryService: CountryServiceProtocol {
    
    var apiClient: CountryApiClientProtocol
    
    init(apiClient: CountryApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getCountry() -> AnyPublisher<CountryEntitie, Error> {
        return apiClient.getCountry()
            .eraseToAnyPublisher()
    }
    
   
}
