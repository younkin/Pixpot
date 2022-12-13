//
//  FavoriteViewController.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 08.12.22.
//

import UIKit
import SnapKit
import Combine

let label = UILabel()



class FavoriteViewController: UIViewController {
    
    private var cancellable = Set<AnyCancellable>()
    
    var buttontest: UIButtonRounded = {
        let button = UIButtonRounded(icon: UIImage(named: "MapBasket"))
        
        button.setTitle("", for: .normal)
        
        
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return button
    }()
    
    
    let systembutton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy Now", for: .normal)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
           return button
           
       }()
    let saleButton: UIButton = {
        let button = UIButton(type: .roundedRect)
           button.backgroundColor = AppColors.white
        button.setTitle("Buy Now", for: .normal)
           button.setTitleColor(AppColors.black, for: .normal)
           button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
   
           return button
           
       }()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        saleButton.tapPublisher.sink { _ in
            print("pablisher")
        }.store(in: &cancellable)
        view.backgroundColor = .red
        label.font = UIFont(name: "Mark-Pro", size: 36)

        label.text = "Favorite Page"
        view.addSubview(buttontest)
        view.addSubview(systembutton)
        view.addSubview(saleButton)
        view.addSubview(label)
        
        buttontest.snp.makeConstraints {
            $0.center.equalTo(view.snp.center).multipliedBy(0.8)
            
        }
        systembutton.snp.makeConstraints {
            $0.center.equalTo(view.snp.center).multipliedBy(0.7)
            
        }
        saleButton.snp.makeConstraints {
            $0.center.equalTo(view.snp.center).multipliedBy(0.9)
            
        }
        label.snp.makeConstraints {
            $0.center.equalTo(view.snp.center)
        }
    }
    
    
    
    @objc func tapped() {
        print("123")
    }
    
    
    
}
