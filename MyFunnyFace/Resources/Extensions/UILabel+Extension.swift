//
//  UILabel+Extension.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/08/10.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

public extension UILabel {
  
  public convenience init(title: String, fontName: String, fontSize: CGFloat, color: UIColor) {
    self.init()
    self.font = UIFont(name: fontName, size: fontSize)
    self.text = title
    self.textColor = color
    self.setAnchor(width: 0, height: 0)
  }
}

public extension UILabel {
  
  static var mainText: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .black
    lbl.textAlignment = .center
    lbl.text = ""
    return lbl
  }()
}
