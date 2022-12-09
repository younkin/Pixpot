//
//  ModuleFactory.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import Foundation

protocol ModuleFactoryProtocol {
    func makeTabBarModule() -> TabBarController
    func makeMainModule() -> MainViewController
    
    func makeFavoriteModule() -> FavoriteViewController
    func makeBusketModule() -> BusketViewController
    func makeProfileModule() -> ProfileViewController
}

final class ModuleFactory: ModuleFactoryProtocol {
    
    
    
    func makeMainModule() -> MainViewController {
        return MainViewController()
    }
    
    
    func makeTabBarModule() -> TabBarController {
        return TabBarController()
    }

    func makeFavoriteModule() -> FavoriteViewController {
        return FavoriteViewController()
    }
    func makeBusketModule() -> BusketViewController {
        return BusketViewController()
    }
    func makeProfileModule() -> ProfileViewController {
        return ProfileViewController()
    }
    
    
    
    
}

