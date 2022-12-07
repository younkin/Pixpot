//
//  AppColors.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit

enum AppColors {

    private static let missingColor: UIColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
  
    static let orange = UIColor(named: "orange") ?? missingColor
    static let darkBlue = UIColor(named: "darkBlue") ?? missingColor
    static let black = UIColor(named: "black") ?? missingColor
    static let grey = UIColor(named: "grey") ?? missingColor
    static let white = UIColor(named: "white") ?? missingColor
    
}
