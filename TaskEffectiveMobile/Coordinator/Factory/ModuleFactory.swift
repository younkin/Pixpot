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
}

final class ModuleFactory: ModuleFactoryProtocol {
    
    
    
    func makeMainModule() -> MainViewController {
        return MainViewController()
    }
    func makeTabBarModule() -> TabBarController {
        return TabBarController()
    }

  
}

