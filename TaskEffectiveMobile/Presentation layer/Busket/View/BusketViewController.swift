//
//  BusketViewController.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 08.12.22.
//

import UIKit
import Foundation


final class BusketViewController: UIViewController {
    
    let basketViewModel: BasketViewModel
    private lazy var basketView = self.view as? BasketView
    
    init(basketViewModel: BasketViewModel) {
        self.basketViewModel = basketViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        let basketView = BasketView(viewModel: basketViewModel)
        self.view = basketView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = true 
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
