//
//  TabBarCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit

final class TabBarCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    private var tabBarController = TabBarController()

    // MARK: - Initialisers

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }

    // MARK: - Public Methods

    override func start() {
        initializeTabBar()
    }

    // MARK: - Private Methods

    private func initializeTabBar() {
        // стандартная реализация таба

        let mainNavigationController = MainNavigationController()
        mainNavigationController.tabBarItem = UITabBarItem(title: "Главный", image: UIImage(named: "dot"), tag: 0)
        let mainCoordinator = coordinatorFactory.makeMain(with: Router(rootController: mainNavigationController))

        
       
        
        
        tabBarController.viewControllers = [mainNavigationController]

       
        
        router.setRoot(tabBarController, animated: false, hideBar: true)

        retain(mainCoordinator)


        mainCoordinator.start()


    
        
        
      
    }



    


}
