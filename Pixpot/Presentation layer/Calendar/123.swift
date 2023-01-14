////
////  123.swift
////  Pixpot
////
////  Created by Евгений Юнкин on 14.01.23.
////
//
//import Foundation
//class CalendarViewController: UIViewController {
//let logoImageView = UIImageView()
//let backButton = UIButton()
//let pictureImageView = UIImageView()
//let chooseDateButton = UIButton()
//let chooseTimeButton = UIButton()
//let saveButton = UIButton()
//var logoLabel = UILabel()
//let arenaLabel: UILabel = UILabel()
//let adressLabel: UILabel = UILabel()
//var facilityLabel: UILabel = UILabel()
//let timePicker = UIDatePicker()
//let timeSavedLabel: UIView = UIView()
//
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    setupTimeSavedLabel()
//    view.backgroundColor = UIColor(hexString: "#0B395E")
//    
//    
//    arenaLabel.text = "Puskás Aréna"
//    arenaLabel.frame = CGRect(x: 0, y: 0, width: 172, height: 29)
//    arenaLabel.backgroundColor = .clear
//    arenaLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//    arenaLabel.font = UIFont(name: "Montserrat-Bold", size: 24)
//    
//    
//    adressLabel.text = "Budapest, Istvánmezei út 3-5, 1146, Hungary"
//    adressLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//    adressLabel.font = UIFont(name: "Montserrat-Regular", size: 10)
//    adressLabel.numberOfLines = 0
//    adressLabel.lineBreakMode = .byWordWrapping
//    
//    
//    logoLabel.text = "Find all sports\nnear you"
//    logoLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//    logoLabel.font = UIFont(name: "Montserrat-Bold", size: 18)
//    logoLabel.numberOfLines = 0
//    logoLabel.lineBreakMode = .byWordWrapping
//    logoLabel.translatesAutoresizingMaskIntoConstraints = false
//    
//    
//    logoImageView.image = UIImage(named: "logo 2")
//    
//    
//    backButton.setImage(UIImage(named: "Arrow Left"), for: .normal)
//    backButton.setTitleColor(.black, for: .normal)
//    backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//    
//    
//    pictureImageView.contentMode = .scaleAspectFit
//    pictureImageView.image = UIImage(named: "Group 1171274895")
//    
//    
//    chooseDateButton.setTitle("Choose date", for: .normal)
//    chooseDateButton.frame = CGRect(x: 0, y: 0, width: 271, height: 60)
//    chooseDateButton.backgroundColor = .white
//    chooseDateButton.layer.backgroundColor = UIColor(red: 0, green: 0.459, blue: 0.804, alpha: 1).cgColor
//    chooseDateButton.layer.cornerRadius = 5
//    chooseDateButton.addTarget(self, action: #selector(callDP), for: .touchUpInside)
//    
//    
//    
//    chooseTimeButton.setTitle("Choose time", for: .normal)
//    chooseTimeButton.frame = CGRect(x: 0, y: 0, width: 271, height: 60)
//    chooseTimeButton.backgroundColor = .white
//    chooseTimeButton.layer.backgroundColor = UIColor(red: 0, green: 0.459, blue: 0.804, alpha: 1).cgColor
//    chooseTimeButton.layer.cornerRadius = 5
//    chooseTimeButton.addTarget(self, action: #selector(callTP), for: .touchUpInside)
//    
//    
//    facilityLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//    facilityLabel.font = UIFont(name: "Gilroy-Bold", size: 14)
//    facilityLabel.numberOfLines = 0
//    facilityLabel.lineBreakMode = .byWordWrapping
//    facilityLabel.frame = CGRect(x: 0, y: 0, width: 271, height: 48)
//    facilityLabel.backgroundColor = .clear
//    facilityLabel.textAlignment = .center
//    facilityLabel.text = "Please make sure the facility has\na booking available for this time"
//    
//    
//    saveButton.setTitle("Save", for: .normal)
//    saveButton.frame = CGRect(x: 0, y: 0, width: 271, height: 60)
//    saveButton.backgroundColor = .white
//    saveButton.layer.backgroundColor = UIColor(red: 0, green: 0.459, blue: 0.804, alpha: 1).cgColor
//    saveButton.layer.cornerRadius = 5
//    saveButton.addTarget(self, action: #selector(saved), for: .touchUpInside)
//    
//
//    timeSavedLabel.frame = CGRect(x: 0, y: 0, width: 343, height: 75)
//    timeSavedLabel.backgroundColor = .clear
//    timeSavedLabel.isHidden = true
//    timeSavedLabel.layer.cornerRadius = 5
//    timeSavedLabel.layer.borderWidth = 1
//    timeSavedLabel.layer.borderColor = UIColor(red: 0.651, green: 0.91, blue: 0.173, alpha: 1).cgColor
//    
//    
//    view.addSubview(chooseDateButton)
//    view.addSubview(chooseTimeButton)
//    view.addSubview(facilityLabel)
//    view.addSubview(saveButton)
//    view.addSubview(timeSavedLabel)
//    
//    
//    
//    //        logoImageView.snp.makeConstraints { make in
//    //            make.left.equalToSuperview().offset(20)
//    //            make.top.equalToSuperview().offset(50)
//    //            make.width.equalTo(38)
//    //            make.height.equalTo(41)
//    //        }
//    //
//    //        logoLabel.snp.makeConstraints { make in
//    //            make.left.equalTo(logoImageView.snp.right)
//    //            make.top.equalToSuperview().offset(20)
//    //            make.height.equalTo(44)
//    //            make.width.equalTo(134)
//    //        }
//    //
//    //        backButton.snp.makeConstraints { make in
//    //            make.top.equalTo(80)
//    //            make.right.equalToSuperview().offset(-20)
//    //            make.height.width.equalTo(24)
//    //        }
//    //
//    //        pictureImageView.snp.makeConstraints { make in
//    //            make.width.equalToSuperview()
//    //            make.height.equalTo(203)
//    //            make.top.equalTo(logoLabel.snp.bottom)
//    //            make.left.equalTo(16)
//    //        }
//    //
//    //
//    //        arenaLabel.snp.makeConstraints { make in
//    //            make.left.equalTo(172)
//    //            make.top.equalTo(pictureImageView.snp.bottom).offset(20)
//    //            make.height.equalTo(16)
//    //            make.width.equalTo(296)
//    //        }
//    //
//    //
//    //        adressLabel.snp.makeConstraints { make in
//    //            make.left.equalTo(166)
//    //            make.top.equalTo(arenaLabel.snp.bottom).offset(5)
//    //            make.height.equalTo(16)
//    //            make.width.equalTo(325)
//    //        }
//    
//    
//    chooseDateButton.snp.makeConstraints { make in
//        make.leading.equalToSuperview().offset(52)
//        make.top.equalTo(384)
//        make.width.equalTo(271)
//        make.height.equalTo(60)
//    }
//    
//    chooseTimeButton.snp.makeConstraints { make in
//        make.leading.equalToSuperview().offset(52)
//        make.top.equalTo(470)
//        make.width.equalTo(271)
//        make.height.equalTo(60)
//    }
//    
//    facilityLabel.snp.makeConstraints { make in
//        make.leading.equalToSuperview().offset(52)
//        make.top.equalTo(543)
//        make.width.equalTo(271)
//        make.height.equalTo(48)
//    }
//    
//    saveButton.snp.makeConstraints { make in
//        make.leading.equalToSuperview().offset(52)
//        make.top.equalTo(617)
//        make.width.equalTo(271)
//        make.height.equalTo(60)
//    }
//    
//    timeSavedLabel.snp.makeConstraints { make in
//        make.leading.equalToSuperview().offset(16)
//        make.top.equalTo(375)
//        make.width.equalTo(343)
//        make.height.equalTo(75)
//    }
//}
//
//
//@objc func backButtonTapped() {
//    
//}
//
//
//func setupTimeSavedLabel() {
//    var timeSaved = UILabel()
//    var reminderLogo = UILabel()
//    
//    timeSaved.frame = CGRect(x: 0, y: 0, width: 226, height: 17)
//    timeSaved.backgroundColor = .white
//    timeSaved.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//    timeSaved.font = UIFont(name: "Montserrat-Bold", size: 14)
//    timeSaved.text = "Time is saved"
//    
//    
//    reminderLogo.frame = CGRect(x: 0, y: 0, width: 215, height: 12)
//    reminderLogo.backgroundColor = .white
//    reminderLogo.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//    reminderLogo.font = UIFont(name: "Montserrat-Regular", size: 10)
//    reminderLogo.text = "We also add reminder for tghis time to you"
//    
//    
//    timeSavedLabel.addSubview(timeSaved)
//    timeSavedLabel.addSubview(reminderLogo)
//    
//}
//
//@objc func saved() {
//    
//    if chooseDateButton.isHidden == false {
//        chooseDateButton.isHidden = true
//        chooseTimeButton.isHidden = true
//        facilityLabel.isHidden = true
//        saveButton.setTitle("Close", for: .normal)
//        saveButton.snp.makeConstraints { make in
//            make.top.equalTo(487)
//        }
//        
//        timeSavedLabel.isHidden = false
//    } else {
//        
//        
//    }
//}
//
//
//
//
//}
//
//
//
//
//extension CalendarViewController {
//
//@objc func changeTime(sender: UIDatePicker) {
//    let formatter = DateFormatter()
//    formatter.timeStyle = .short
//    formatter.dateFormat = "HH:mm"
//    var time = formatter.string(from: sender.date)
//    chooseTimeButton.setTitle(time, for: .normal)
//    chooseTimeButton.layer.backgroundColor = UIColor(hexString: "#B4E554").cgColor
//    UserDefaults.standard.set(encodable: time, forKey: "selectedTime")
//}
//
//@objc func changeDate(_ sender: UIDatePicker) {
//    let dateFormatter: DateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM.dd.yyyy"
//    let selectedDate: String = dateFormatter.string(from: sender.date)
//    chooseDateButton.setTitle(selectedDate, for: .normal)
//    chooseDateButton.layer.backgroundColor = UIColor(hexString: "#B4E554").cgColor
//    UserDefaults.standard.set(encodable: selectedDate, forKey: "selectedDate")
//}
//
//
//
//
//
//@objc func callTP()  {
//    if self.view.viewWithTag(9) != nil {
//        return
//    }
//    let toolbarTargetFrame = CGRect(x: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.maxY - 250 - 44, width: self.view.frame.width, height: 44)
//    let timePickerTargetFrame = CGRect(x: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.maxY - 250, width: self.view.frame.width, height: 250)
//    let darkView = UIView(frame: self.view.bounds)
//    darkView.alpha = 0
//    darkView.backgroundColor = .black
//    darkView.tag = 9
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissDatePicker))
//    darkView.addGestureRecognizer(tapGesture)
//    self.view.addSubview(darkView)
//    
//    timePicker.datePickerMode = UIDatePicker.Mode.time
//    timePicker.frame = CGRect(x: 0, y: self.view.bounds.size.height + 70, width: 320, height: 250)
//    timePicker.tag = 10
//    timePicker.preferredDatePickerStyle = .wheels
//    
//    timePicker.addTarget(self, action: #selector(changeTime), for: UIControl.Event.valueChanged)
//    self.view.addSubview(timePicker)
//    
//    let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.size.height, width: 320, height: 44))
//    toolBar.tag = 11
////        toolBar.barStyle = UIBarStyle.black
////        toolBar.isTranslucent = true
//    
//    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissDatePicker))
//    toolBar.setItems([spacer, doneButton], animated: false)
//    self.view.addSubview(toolBar)
//    
//    UIView.beginAnimations("MoveIn", context: nil)
//    toolBar.frame = toolbarTargetFrame
//    timePicker.frame = timePickerTargetFrame
//    darkView.alpha = 0.5
//    UIView.commitAnimations()
//    
//}
//
//@objc func callDP(_ sender: Any) {
//    if self.view.viewWithTag(9) != nil {
//        return
//    }
//    
//    let toolbarTargetFrame = CGRect(x: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.maxY - 250 - 44, width: self.view.frame.width, height: 44)
//    let datePickerTargetFrame = CGRect(x: 0, y: self.view.safeAreaLayoutGuide.layoutFrame.maxY - 250, width: self.view.frame.width, height: 250)
//    
//    let darkView = UIView(frame: self.view.bounds)
//    darkView.alpha = 0
//    darkView.backgroundColor = .black
//    darkView.tag = 9
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissDatePicker))
//    darkView.addGestureRecognizer(tapGesture)
//    self.view.addSubview(darkView)
//    
//    let datePicker = UIDatePicker(frame: CGRect(x: 0, y: self.view.bounds.size.height + 70, width: 320, height: 250))
//    datePicker.tag = 10
//    datePicker.preferredDatePickerStyle = .inline
//    datePicker.addTarget(self, action: #selector(changeDate), for: .valueChanged)
//    datePicker.backgroundColor = AppColors.white
//    self.view.addSubview(datePicker)
//    
//    let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.size.height, width: 320, height: 44))
//    toolBar.tag = 11
//    toolBar.barStyle = UIBarStyle.black
//    toolBar.isTranslucent = true
//    
//    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissDatePicker))
//    toolBar.setItems([spacer, doneButton], animated: false)
//    self.view.addSubview(toolBar)
//    
//    UIView.beginAnimations("MoveIn", context: nil)
//    toolBar.frame = toolbarTargetFrame
//    datePicker.frame = datePickerTargetFrame
//    darkView.alpha = 0.5
//    UIView.commitAnimations()
//    
//}
//
//@objc func removeViews() {
//    if let viewWithTag = self.view.viewWithTag(9) {
//        viewWithTag.removeFromSuperview()
//    }
//    if let viewWithTag = self.view.viewWithTag(10) {
//        viewWithTag.removeFromSuperview()
//    }
//    if let viewWithTag = self.view.viewWithTag(11) {
//        viewWithTag.removeFromSuperview()
//    }
//}
//
//@objc func dismissDatePicker(_ sender: Any) {
//    let toolbarTargetFrame = CGRect(x: 0, y: self.view.bounds.size.height, width: 320, height: 44)
//    let datePickerTargetFrame = CGRect(x: 0, y: self.view.bounds.size.height + 44, width: 320, height: 216)
//    UIView.beginAnimations("MoveOut", context: nil)
//    self.view.viewWithTag(9)?.alpha = 0
//    self.view.viewWithTag(10)?.frame = datePickerTargetFrame
//    self.view.viewWithTag(11)?.frame = toolbarTargetFrame
//    UIView.setAnimationDelegate(self)
//    UIView.setAnimationDidStop(#selector(removeViews))
//    UIView.commitAnimations()
//}
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//extension UserDefaults {
//
//func set<T: Encodable>(encodable: T, forKey key: String) { // Т - любой тип данных (String, Person, Beer etc)
//    guard let data = try? JSONEncoder().encode(encodable) else { return } // превращаем входящий объект Codable в 010101101101
//    set(data, forKey: key)  // записываем 01010101010 в UserDefaults
//}
//
//func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? { // Т - любой тип данных (String, Person, Beer etc), T.Type - имя класса для этого типа
//    guard let data = object(forKey: key) as? Data, // читаем 001010001 из UserDefaults
//          let value = try? JSONDecoder().decode(type, from: data) else { return nil } // пытаемся конвертировать 0010101 в нужный нам объект класса Т
//    return value // возвращаем объект
//}
//
//}
//
//extension UIColor {
//convenience init(hexString: String) {
//    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
//    var int = UInt64()
//    Scanner(string: hex).scanHexInt64(&int)
//    let a, r, g, b: UInt64
//    switch hex.count {
//    case 3: // RGB (12-bit)
//        (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
//    case 6: // RGB (24-bit)
//        (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
//    case 8: // ARGB (32-bit)
//        (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
//    default:
//        (a, r, g, b) = (255, 0, 0, 0)
//    }
//    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
//}
//}
