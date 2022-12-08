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

        setup()
        setupBackground()
    }
    
    
    func setup() {
        

        tabBar.itemWidth = tabBar.bounds.width / 10
        tabBar.itemPositioning = .centered
        
        tabBar.tintColor = AppColors.white
        tabBar.unselectedItemTintColor = AppColors.white
    
        
}
    func setupBackground() {
        let positionX: CGFloat = 0
        let PositionY: CGFloat = 8
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + PositionY * 2
        let rounderLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: positionX, y: tabBar.bounds.minY - PositionY, width: width, height: height), cornerRadius: height / 2 )
        rounderLayer.path = bezierPath.cgPath
        rounderLayer.fillColor = AppColors.darkBlue.cgColor
        tabBar.layer.insertSublayer(rounderLayer, at: 0)
    }



   
}


