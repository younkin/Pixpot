//
//  UIButton.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 13.12.2022.
//

import UIKit
import Combine

extension UIButton {

    var tapPublisher: EventPublisher {
        publisher(for: .touchUpInside)
    }

}
