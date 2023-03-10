//
//  CalendarCoordinator.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 11.01.23.
//

import UIKit

final class CalendarCoordinator: BaseCoordinator, PushRoutable {

    // MARK: - Properies
    private let moduleFactory: ModuleFactoryProtocol
    private let router: Router
    
    private weak var calendar: CalendarViewController?
    
    // MARK: - Init
    init(router: Router, moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
        self.router = router
    }

    func consume(_ deeplink: Deeplink) {
        switch deeplink {
        case .item(let listItem):
        
            calendar?.setupCategory(localData: listItem)
//            UIImage(named: listItem.imageBig)
//            calendar?.title = listItem.name
        }
    }
    
    // MARK: - Navigation functions
    override func start() {
        showProfileScreen()
    }

    // MARK: -
    private func showProfileScreen() {

        let profilePage = moduleFactory.makeCalendarModule()
        self.calendar = profilePage
        
        self.router.push(profilePage, animated: true)
        
        
        calendar?.chosenSportStadium = { [weak self] (sportStadium, localData)in
            let sheduleVC = SheduleVC(sportStadium: sportStadium, localData: localData)
            self?.router.push(sheduleVC, animated: true)
            
            sheduleVC.backTapped = {
                self?.router.pop(animated: true)
            }
            
            sheduleVC.addScheduleTapped = {
                
            }
//            print(sportStadium.name)
            
        }
    }
}

