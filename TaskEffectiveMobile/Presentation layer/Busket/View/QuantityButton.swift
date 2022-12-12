//
//  QuantityButton.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 10.12.2022.
//

import Foundation
import UIKit
import SnapKit

class QuantityButton: UIControl {
    
    enum ActionState {
       case initial(Int), tap, increase, decrease, start(Int)
   }

   // MARK: - Private Properties

   private var count: Int = 0

    private lazy var plusButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "PlusBasket"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.tintColor = AppColors.white
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 7, bottom: 8, right: 7)
        return button
    }()
    
    private lazy var minusButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "MinusBasket"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.tintColor = AppColors.white
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 7, bottom: 2, right: 7)
        return button
    }()
    
   private lazy var textField: UITextField = {
       let textField = UITextField()

       textField.layer.masksToBounds = true
       textField.backgroundColor = .clear
       textField.text = quantity
       textField.textColor = AppColors.white
       textField.font = AppFont.montserratFont(ofSize: 20, weight: .medium)
       textField.textAlignment = .center

       textField.delegate = self
       return textField
   }()

   // MARK: - Public Properties

   let maxCount: Int = 50
    
   var quantity: String {
       return String(count)
   }
    
   var onChange: ((String) -> Void)?

   // MARK: - Initialisers

   override init(frame: CGRect) {
       super.init(frame: frame)

       backgroundColor = AppColors.grey
       
       layer.masksToBounds = true
       
       
       addSubview(minusButton)
       addSubview(textField)
       addSubview(plusButton)
       setupUI()
       
       
   }

   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

   // MARK: - Lifecycle

   override func layoutSubviews() {
       super.layoutSubviews()
       layer.cornerRadius = frame.height / 6
       
   }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
       
    }

   // MARK: - Private Methods

   @objc private func minusButtonTapped() {
       updateCount(action: .decrease)
   }

   @objc private func plusButtonTapped() {
       updateCount(action: .increase)
   }

//   @objc private func buyButtonTapped() {
//       updateCount(action: .tap)
//   }
// swiftlint:disable identifier_name
//   private func performAnimation(from: UIView, to: UIView) {
//       UIView.transition(from: from,
//                         to: to,
//                         duration: 0.3,
//                         options: [.transitionCrossDissolve, .showHideTransitionViews, .curveEaseInOut],
//                         completion: nil)
//   }
   // swiftlint:enable identifier_name

    func updateCount(action: ActionState) {
       switch action {
       case .initial(let value):
           if value == 0 {
               count = value
             //  performAnimation(from: textField, to: buyButton)
           }
       case .tap:
           count += 1
           //performAnimation(from: buyButton, to: textField)
       case .increase:
           if count >= maxCount { return }
           count += 1
       case .decrease:
           count -= 1
           if count < 1 {
              // performAnimation(from: textField, to: buyButton)
           }
       case .start(let value):
           if value != 0 {
               count = value
               //performAnimation(from: buyButton, to: textField)
           }
       }
       textField.text = quantity
       onChange?(quantity)
       textField.resignFirstResponder()
   }

}

extension QuantityButton: UITextFieldDelegate {

   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       return string.isEmpty || Int(string) != nil && textField.text?.count ?? 0 < 3

   }

   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       return textField.resignFirstResponder()
   }
   func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
       return false
   }

   func textFieldDidEndEditing(_ textField: UITextField) {
       if textField.text == "" || textField.text == "0" {
           updateCount(action: .initial(0))
       } else {
           let text = Int(textField.text ?? "0") ?? 0
           count = text > maxCount ? maxCount : text
           updateCount(action: .initial(count))
       }
   }
    
    private func setupUI() {
        
    
        
        minusButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(minusButton.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
}
