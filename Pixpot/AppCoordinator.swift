//
//  AppCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit

final class AppCoordinator: BaseCoordinator {

   
    
    // MARK: - Private Properties

    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    

    // MARK: - Initialisers

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    // MARK: - Public Methods

    override func start() {
        startTabbar()
    }

    // MARK: - Private Methods
    
    private func performCountryFlow() {
        
       
        
//        router.setRoot(UIViewController(), animated: false)
        
//            loadingScreenCoordinator.appWay = {[weak self] appWay in
//                guard let self = self else {return}
//                switch appWay {
//                case .webView:
//                    self.launch = .webView
//                    self.start()
//                case .app:
//                    self.performAppFlow()
//                case .countryVerify:
//                    break
//                }
//            
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//            self.launch = .app
//            self.launch = .webView
//            self.performAppFlow()
//            self.performWebViewFlow()
        })
    }
    
    private func performWebViewFlow() {
        
     

    }
    
    private func startTabbar() {
        let tabBarCoordinator = coordinatorFactory.makeTabBarCoordinator(with: router)
        retain(tabBarCoordinator)
        tabBarCoordinator.start()
    }
    
}
