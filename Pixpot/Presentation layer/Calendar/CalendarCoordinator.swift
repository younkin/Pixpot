//
//  CalendarCoordinator.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 11.01.23.
//

import UIKit

final class CalendarCoordinator: BaseCoordinator {

    // MARK: - Properies
    private let moduleFactory: ModuleFactoryProtocol
    private let router: Router

    // MARK: - Init
    init(router: Router, moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
        self.router = router
    }

    // MARK: - Navigation functions
    override func start() {
        showProfileScreen()
    }

    // MARK: -
    private func showProfileScreen() {

        let profilePage = moduleFactory.makeCalendarModule()

        self.router.push(profilePage, animated: true)
    }
}

