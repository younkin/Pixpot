//
//  DatePickerView.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//

import Foundation
import UIKit
import SnapKit


class DatePickerView: UIView {
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = AppColors.green
        return datePicker
    }()
    let timePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.backgroundColor = AppColors.green
        return datePicker
    }()
    
    let chooseDateLabel: UILabel = {
       let label = UILabel()
        label.text = "Choose date:"
        label.font = AppFont.markProFont(ofSize: 18, weight: .bold)
        label.textColor = AppColors.white
        return label
    }()
    
    let chooseTimeLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = AppColors.blue
        label.text = "Choose time:"
        label.font = AppFont.markProFont(ofSize: 18, weight: .bold)
        label.textColor = AppColors.white
        return label
    }()
    
    let chooseDateView: UIView = {
       let view = UIView()
        view.backgroundColor = AppColors.blue
        return view
    }()
    
    
    let chooseTimeView: UIView = {
       let view = UIView()
        view.backgroundColor = AppColors.blue
        return view
    }()
    
    let infoLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = AppColors.darkBlue
        label.text = "Please make sure the facility has a booking available for this time"
        label.font = AppFont.markProFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 0
        label.textColor = AppColors.white
        return label
    }()
    
    
      init() {
          super.init(frame: .zero)
          
          
          setupConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        chooseDateView.layer.cornerRadius = min(timePicker.bounds.size.width, timePicker.bounds.size.height) / 8
        chooseTimeView.layer.cornerRadius = min(timePicker.bounds.size.width, timePicker.bounds.size.height) / 8
        chooseDateView.clipsToBounds = true
        chooseTimeView.clipsToBounds = true
        
        datePicker.layer.cornerRadius = min(timePicker.bounds.size.width, timePicker.bounds.size.height) / 8
        timePicker.layer.cornerRadius = min(timePicker.bounds.size.width, timePicker.bounds.size.height) / 8
        datePicker.clipsToBounds = true
        timePicker.clipsToBounds = true
    }
    
    
    func setupConstraints() {
//        addSubview(chooseDate)
//        addSubview(chooseTime)
        addSubview(chooseDateView)
        addSubview(chooseTimeView)
        chooseDateView.addSubview(chooseDateLabel)
        chooseTimeView.addSubview(chooseTimeLabel)
        chooseDateView.addSubview(datePicker)
        chooseTimeView.addSubview(timePicker)
        addSubview(infoLabel)
//        addSubview(datePicker)
//        addSubview(timePicker)
        
        
        chooseDateView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
            $0.height.equalTo(60)
        }
        
        chooseTimeView.snp.makeConstraints {
            $0.top.equalTo(chooseDateView.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
            $0.height.equalTo(60)
        }
        chooseDateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(5)
        }
        chooseTimeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(5)
        }
        
        datePicker.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-5)
        }
        timePicker.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-5)
        }
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(chooseTimeView.snp.bottom).offset(5)
            
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        
        
    }
    
}




