//
//  BusketViewModel.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import Combine

final class BasketViewModel {

    var basketService: BasketServiceProtocol
    
    init(basketService: BasketServiceProtocol) {
        self.basketService = basketService
    }
    
}
