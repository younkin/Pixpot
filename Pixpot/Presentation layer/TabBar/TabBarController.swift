//
//  ViewController.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//



import UIKit


final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        setup()
        setupBackground()
    }
    
    
    func setup() {
        tabBar.itemWidth = tabBar.bounds.width / 5
        tabBar.itemPositioning = .centered
        tabBar.barTintColor = AppColors.darkBlue
        
        
}
    
    func setupBackground() {
        let positionX: CGFloat = 40
        let PositionY: CGFloat = 10
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + PositionY * 2
        let rounderLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: positionX, y: tabBar.bounds.minY - PositionY, width: width, height: height), cornerRadius: height / 10 )
        rounderLayer.path = bezierPath.cgPath
        rounderLayer.fillColor = AppColors.green.cgColor
        tabBar.layer.insertSublayer(rounderLayer, at: 0)
    }

   
}

extension TabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
        
        
//        if item == tabBar.items![0] {
//            item.selectedImage = .init(named: "HomeOn")
//        }
//        if item == tabBar.items![1] {
//            item.selectedImage = .init(named: "CalendarOn")
//           
//        }
//        if item == tabBar.items![2] {
//            item.selectedImage = .init(named: "UserOn")
//            
//        }
    }
    
}


