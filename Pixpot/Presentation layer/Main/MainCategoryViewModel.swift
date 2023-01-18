//
//  CategoryViewModel.swift
//  Sarawan
//
//  Created by MAC on 04.11.2021.
//

import Foundation
import Combine

protocol MainCategoryViewModelOutput {
    var data: ((ListItem) -> Void)? {get set}
}


final class MainCategoryViewModel: MainCategoryViewModelOutput {
    
    
    var data: ((ListItem) -> Void)?
    

    var pageIndicator = PassthroughSubject<Int, Never>()
  
}
