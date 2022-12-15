//
//  ProductViewController.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 14.12.2022.
//

import Foundation
import UIKit
import Combine

final class ProductViewController: UIViewController  {
    
    let productViewModel: ProductViewModel
    private lazy var productView = self.view as? ProductView
    
    init(viewModel: ProductViewModel) {
        self.productViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        
        let productView = ProductView()
        self.view = productView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
