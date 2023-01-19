//
//  DatePickerView.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//

import Foundation
import UIKit
import SnapKit
import Combine

class DatePickerView: UIView {
    
     let setDate = PassthroughSubject<Date?, Never>()
     let setTime = PassthroughSubject<Date?, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = AppColors.green
        datePicker.minimumDate = Date() // current date
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date()) // 1 year after current date
        datePicker.addTarget(self, action: #selector(dateUpdated), for: .valueChanged)
        return datePicker
    }()
    let timePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.backgroundColor = AppColors.green
        datePicker.addTarget(self, action: #selector(timeUpdated), for: .valueChanged)
        
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
    
    var currentSelectedDate: Date? {
        didSet {
            print("setted")
        }
        
    }

      init() {
          super.init(frame: .zero)
          
      
//          currentSelectedDate = datePicker.date
//          datePicker.date.
          setupConstraints()
          
//          datePicker.
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func dateUpdated() {
        setDate.send(datePicker.date)
        print("date setted")
    }
    
    @objc func timeUpdated() {
        setTime.send(timePicker.date)
        print("time setted")
    }
    @objc func checkDates() {
////         Get the selected dates from the date pickers
//        let date = datePicker.date
//        let time = timePicker.date
//
//        // Check if both date pickers have selected dates
//        if date != nil, time != nil {
//            print(date)
//            print(time)
//            print("yes")
//        } else {
//            print("not")
//        }
//        datePicker
//            .publisher(for: \.date)
//            .compactMap { $0 }
//            .assign(to: \.selectedDate, on: self)
//            .store(in: &cancellables)
//
//        timePicker
//            .publisher(for: \.date)
//            .compactMap { $0 }
//            .assign(to: \.selectedTime, on: self)
//            .store(in: &cancellables)
//
//
//
//        $selectedDate
//            .combineLatest($selectedTime)
//            .map { date, time -> Bool in
//                return date != nil && time != nil
//            }
//            .sink(receiveValue: { data in
//                print(data)
//            })
//            .store(in: &cancellables)
//
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




