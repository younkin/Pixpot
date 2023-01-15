//
//  AskForPermissionView.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 15.01.23.
//

import Foundation
import UIKit
import SnapKit

class AskForPermissionView: UIView {
    
    var allowTap: (() -> Void)?
    
    
    private lazy var boarderView: UIView = {
       let view = UIView()
        view.layer.bounds = CGRect(x: 0, y: 0, width: 3, height: 3)
        view.layer.borderColor = AppColors.green.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var infoHeadLabel: UILabel = {
        let label = UILabel()
        label.text = "We did not have permission to check your location"
        label.numberOfLines = 0
        label.font = AppFont.markProFont(ofSize: 16, weight: .heavy)
        label.textColor = AppColors.white
        return label
    }()
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Please, allow us to track your location to find the most relevant sports facilities. "
        label.textColor = AppColors.white
        label.numberOfLines = 0
        label.font = AppFont.markProFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private lazy var askButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Allow", for: .normal)
        button.setTitleColor(AppColors.white, for: .normal)
        button.backgroundColor = AppColors.blue
        button.titleLabel?.font = AppFont.markProFont(ofSize: 18, weight: .heavy)
        button.addTarget(self, action: #selector(allowTapped), for: .touchUpInside)
         return button
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
        askButton.layer.cornerRadius = min(askButton.bounds.size.width, askButton.bounds.size.height) / 10
        askButton.clipsToBounds = true
        
        boarderView.layer.cornerRadius = min(boarderView.bounds.size.width, boarderView.bounds.size.height) / 10
        boarderView.clipsToBounds = true
    }
    
    @objc func allowTapped(){
        allowTap?()
    }
    
    func setupUI() {
        addSubview(boarderView)
        boarderView.addSubview(infoHeadLabel)
        boarderView.addSubview(infoLabel)
        addSubview(askButton)
        
        boarderView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.right.equalToSuperview().offset(-5)
            $0.left.equalToSuperview().offset(5)
            $0.bottom.equalTo(askButton.snp.top).offset(-20)
        }
        
        infoHeadLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(16)
            $0.left.equalTo(self).offset(21)
            $0.width.equalTo(self).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(infoHeadLabel.snp.bottom).offset(5)
            $0.left.equalTo(self).offset(21)
            $0.width.equalTo(self).multipliedBy(0.8)
            $0.height.equalTo(40)
        }
        
        
        askButton.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.7)
            $0.height.equalTo(60)
        }
        
    }
    
}
