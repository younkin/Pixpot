//
//  FilterView.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 18.12.22.
//

import UIKit


class FilterView: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Filter options"
        label.textColor = AppColors.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private(set) lazy var backButton = RoundedNavButton(image: UIImage(named: "BasketBack")!, color: AppColors.darkBlue)
    private(set) lazy var doneButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(AppColors.white, for: .normal)
        button.setTitleColor(AppColors.orange, for: .highlighted)
        button.backgroundColor = AppColors.orange
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
      
       layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 1
       layer.shadowOffset = .zero
        layer.shadowRadius = 10
        
        addViews()
        makeConstraints()
        backgroundColor = AppColors.background
        stackView.backgroundColor = AppColors.background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = minSize(object: self) / 18
        doneButton.layer.cornerRadius = 8
        stackView.layer.cornerRadius = minSize(object: stackView) / 4
    }
    
    
    func minSize(object: AnyObject) -> CGFloat {
       return min(object.layer.frame.width , object.layer.frame.height)
    }
    
    func addViews() {
       addSubview(stackView)
    
       stackView.addSubview(backButton)
        stackView.addSubview(titleLabel)
        stackView.addSubview(doneButton)
        
    }
    
    
    func makeConstraints() {
        stackView.snp.makeConstraints {
//            $0.top.equalTo(safeAreaLayoutGuide)
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(70)
        }
        backButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(44)
            $0.centerY.equalTo(stackView.snp.centerY)
            $0.width.height.equalTo(37)
        }
        titleLabel.snp.makeConstraints {
            $0.center.equalTo(stackView.snp.center)
            $0.width.equalTo(114)
            $0.height.equalTo(24)
        }
        doneButton.snp.makeConstraints {
            $0.centerY.equalTo(stackView.snp.centerY)
            $0.right.equalToSuperview().offset(-20)
            $0.width.equalTo(86)
            $0.height.equalTo(37)
        }
        
        
    }
    
    
}
