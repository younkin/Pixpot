//
//  AppCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit

final class AppCoordinator: BaseCoordinator {

    enum LaunchInstructor {
        case countryVerify
        case webView
        case app
        
    }
    
    // MARK: - Private Properties

    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    private var launch: LaunchInstructor = .countryVerify

    // MARK: - Initialisers

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    // MARK: - Public Methods

    override func start() {
        switch launch {
        case .countryVerify:
            performCountryFlow()
        case .webView:
            performWebViewFlow()
        case .app:
            performAppFlow()
        }
    }

    // MARK: - Private Methods
    
    private func performCountryFlow() {
        router.setRoot(UIViewController(), animated: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.launch = .app
            self.performAppFlow()
        })
    }
    
    private func performWebViewFlow() {
        
    }
    
    private func performAppFlow() {
        let tabBarCoordinator = coordinatorFactory.makeTabBarCoordinator(with: router)
        retain(tabBarCoordinator)
        tabBarCoordinator.start()
    }
    
}
