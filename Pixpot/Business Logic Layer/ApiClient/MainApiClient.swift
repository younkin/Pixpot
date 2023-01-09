//
//  MainApiClient.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import Combine

protocol MainApiClientProtocol {
    func getMain() -> AnyPublisher<MainEntitie, Error>
}
 
extension APIClient: MainApiClientProtocol {
    func getMain() -> AnyPublisher<MainEntitie, Error> {
        let request = requestBuilder
            .set(path: .main)
            .set(method: .GET)
            .build()
        return performRequest(request)
    }
    
}
