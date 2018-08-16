//
//  UIView+Extension.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/08/10.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

extension UIView {
  func createHorizontalStackView(views: [UIView]) -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: views)
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    stackView.spacing = 20
    return stackView
  }
}

