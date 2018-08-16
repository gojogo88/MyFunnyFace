//
//  UIButton+Extension.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/07/24.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

extension UIButton {
  
  public convenience init(imageName: String) {
    self.init()
    self.setImage(UIImage(named: imageName), for: .normal)
    self.setAnchor(width: 0, height: 0)
  }
}
 
