//
//  BusketViewModel.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import Combine

final class BasketViewModel {
    
    private var cancellable = Set<AnyCancellable>()
    var basketService: BasketService
    var onMainScreen: (()-> Void)?
    var basket = PassthroughSubject<BasketEntitie, Never>()
    var isLoadingIndicator = PassthroughSubject<Bool, Never>()
    
    init(basketService: BasketService) {
        self.basketService = basketService
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
                    self.isLoadingIndicator.send(false)
                }
            }, receiveValue: { [weak self] basket in
               // self?.basketService.basketSubject.send(basket)
                self?.basket.send(basket)
            }).store(in: &cancellable)
    }
    
    func removeProduct(at index: Int) {
        basketService.basketSubject.value.basket.remove(at: index)
    }
    
}
