//
//  SavedIsEmptyView.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 19.01.23.
//


import Foundation
import UIKit
import SnapKit


class SavedIsEmptyView: UIView {
    
    
    
    
    private lazy var boarderView: UIView = {
       let view = UIView()
        view.layer.bounds = CGRect(x: 0, y: 0, width: 3, height: 3)
        view.layer.borderColor = AppColors.green.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var infoHeadLabel: UILabel = {
        let label = UILabel()
        label.text = "You don’t have reminders yet"
        label.numberOfLines = 0
        label.font = AppFont.markProFont(ofSize: 16, weight: .heavy)
        label.textColor = AppColors.white
        return label
    }()
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Please, add them first"
        label.textColor = AppColors.white
        label.numberOfLines = 0
        label.font = AppFont.markProFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    
    
    init(){
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        
        boarderView.layer.cornerRadius = min(boarderView.bounds.size.width, boarderView.bounds.size.height) / 10
        boarderView.clipsToBounds = true
    }
    
 
    
    func setupUI() {
        addSubview(boarderView)
        boarderView.addSubview(infoHeadLabel)
        boarderView.addSubview(infoLabel)
        
        
        boarderView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.right.equalToSuperview().offset(-5)
            $0.left.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        infoHeadLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(16)
            $0.left.equalTo(self).offset(21)
            $0.width.equalTo(self).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(infoHeadLabel.snp.bottom)
            $0.left.equalTo(self).offset(21)
            $0.width.equalTo(self).multipliedBy(0.8)
            $0.height.equalTo(40)
        }
        
        
    }
    
}


