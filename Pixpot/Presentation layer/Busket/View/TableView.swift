//
//  TableView.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import UIKit

class BasketTableView: UITableView {
    
    lazy var basketTableFooterView: BusketTableViewFooter? = {
        return self.tableFooterView as? BusketTableViewFooter
    }()
    
    override func layoutSubviews() {
            super.layoutSubviews()

            layer.cornerRadius = bounds.height / 23
        
        }
    
}
