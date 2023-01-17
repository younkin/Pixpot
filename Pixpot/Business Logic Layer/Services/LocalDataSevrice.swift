//
//  LocalDataSevrice.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 17.01.23.
//

import Foundation

protocol LocalDataSevriceProtocol {
    
    
    
}

enum LocalDataSevriceError: Error {
    case unknown
}



final class LocalDataSevrice: LocalDataSevriceProtocol {
    
    private var localData = MockData.shared
    
    private let apiClient: NetworkProviderProtocol
    
    init(apiClient: NetworkProviderProtocol) {
        self.apiClient = apiClient
    }
    

    
}

