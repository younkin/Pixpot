//
//  MainModel.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 14.12.22.
//

import Foundation
import Combine

final class MainViewModel {
    
    var basketService: BasketService
    var mainService: MainServiceProtocol
    var productService: ProductServiceProtocol
    
    
    private var cancellable = Set<AnyCancellable>()
    var mainData = PassthroughSubject<MainEntitie, Never>()
    var isLoadingIndicator = PassthroughSubject<Bool, Never>()
    
    init(basketService: BasketService, mainService: MainServiceProtocol, productService: ProductServiceProtocol) {
        self.basketService = basketService
        self.mainService = mainService
        self.productService = productService
    }
    
    
    func getMain() {
        mainService.getMain()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Func getBasket end with failure: \(error)")
                case .finished:
                    print("Func getBasket success!")
                    self.isLoadingIndicator.send(false)
                }
            }, receiveValue: { [weak self] mainData in
               
                self?.mainData.send(mainData)
            }).store(in: &cancellable)
    }
    
    func getBasket() {
        basketService.getBasket()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Func getBasket end with failure: \(error)")
                case .finished:
                    print("Func getBasket success!")
                }
            }, receiveValue: { _ in
            }).store(in: &cancellable)
    }
}
