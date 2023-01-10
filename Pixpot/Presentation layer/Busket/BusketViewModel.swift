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
    var onProductScreen: (()-> Void)?
    var basket = PassthroughSubject<BasketEntitie, Never>()
    var isLoadingIndicator = PassthroughSubject<Bool, Never>()
    
    init(basketService: BasketService) {
        self.basketService = basketService
    }
    
   
    
}
