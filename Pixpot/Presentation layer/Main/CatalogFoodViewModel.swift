//
//  CategoryViewModel.swift
//  Sarawan
//
//  Created by MAC on 04.11.2021.
//

import Foundation
import Combine

final class CatalogFoodViewModel {

    // MARK: - Properties
    private let productService: ProductServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    var isLoadingIndicator = PassthroughSubject<Bool, Never>()
    var pageIndicator = PassthroughSubject<Int, Never>()

    @Published var nameFood: String = ""

    // MARK: - Init
    init(productService: ProductServiceProtocol) {
        self.productService = productService
        isLoadingIndicator.send(true)
    }
}

// MARK: - Public Api
extension CatalogFoodViewModel {

    func getAllFoodMainCatalogs() {
        productService.getProduct()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                   
                case .finished:
                    self.isLoadingIndicator.send(false)
                }
            }, receiveValue: { categories in
              
            }).store(in: &cancellable)
    }
    
}
