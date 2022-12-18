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
    
//    private(set) lazy var backButton = RoundedNavButton(image: UIImage(named: "BasketBack")!, color: AppColors.darkBlue)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        makeConstraints()
        addViews()
        backgroundColor = .black
        stackView.backgroundColor = AppColors.background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func addViews() {
       addSubview(stackView)
    
//        stackView.addSubview(backButton)
    }
    func makeConstraints() {
        stackView.snp.makeConstraints {
//            $0.top.equalTo(safeAreaLayoutGuide)
            $0.top.equalToSuperview()
            $0.height.width.equalTo(400)
        }
//        backButton.snp.makeConstraints {
//            $0.left.equalToSuperview()
//            $0.top.equalToSuperview()
//            $0.width.height.equalTo(30)
//        }
        
    }
    
    
}
