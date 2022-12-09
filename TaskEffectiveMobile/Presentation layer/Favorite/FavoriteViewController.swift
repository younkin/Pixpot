//
//  FavoriteViewController.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 08.12.22.
//

import UIKit
import SnapKit

let label = UILabel()



class FavoriteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        label.font = UIFont(name: "Mark-Pro", size: 36)

        label.text = "Favorite Page"
        
        
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalTo(view.snp.center)
        }
    }
    
    
    
    
}
