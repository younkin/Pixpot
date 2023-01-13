//
//  CountryApiClient.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 13.01.23.
//


import Foundation
import Combine

protocol CountryApiClientProtocol {
    func getCountry() -> AnyPublisher<CountryEntitie, Error>
 
    
}
 
extension APIClient: CountryApiClientProtocol {
    func getCountry() -> AnyPublisher<CountryEntitie, Error> {
        let request = requestBuilder
            .set(path: .country)
            .set(method: .GET)
//            .add(header: "ip", value: ip)
            .build()
        return performRequest(request)
    }
    
 
    
    
}
