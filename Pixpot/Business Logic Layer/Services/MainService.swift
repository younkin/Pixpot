//
//  MainService.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import Combine

protocol MainServiceProtocol {
    func getMain() -> AnyPublisher<MainEntitie, Error>
}

final class MainService: MainServiceProtocol {
    
    var apiClient: MainApiClientProtocol
    
    init(apiClient: MainApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getMain() -> AnyPublisher<MainEntitie, Error> {
        return apiClient.getMain()
            .eraseToAnyPublisher()
    }
}
