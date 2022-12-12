//
//  DIContainer.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation

final class DIContainer {
    
    let session: URLSession
    let decoder: JSONDecoder

    let requestBuilder: RequestBuilder
    let apiClient: APIClient
    
    lazy var basketService = BasketService(apiClient: apiClient)
    lazy var mainService = MainService(apiClient: apiClient)
    lazy var productService = ProductService(apiClient: apiClient)
    
    init() {
        decoder = JSONDecoder()
        session = URLSession.shared
        requestBuilder = RequestBuilder()
        apiClient = APIClient(requestBuilder: requestBuilder, session: session, decoder: decoder)
    }
}
