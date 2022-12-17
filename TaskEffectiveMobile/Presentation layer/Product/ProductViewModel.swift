//
//  ProductViewModel.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 14.12.2022.
//

import Foundation
import Combine

final class ProductViewModel {
    
    private var productService: ProductServiceProtocol?
    private var cancellable = Set<AnyCancellable>()
    var product = PassthroughSubject<ProductEntitie, Never>()
    var isFinish: (()->Void)?
    
    init(service: ProductServiceProtocol) {
        self.productService = service
    }
    
    func getProduct() {
        productService?.getProduct()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Get product successful")
                case .failure(let error):
                    print("Get busket end with error: \(error)")
                }
            }, receiveValue: { [weak self] product in
                self?.product.send(product)
            }).store(in: &cancellable)
        
    }
}
