//
//  UIImageView+Extension.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/08/10.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

public extension UIImageView {
  
  public convenience init(imageName: String) {
    self.init()
    self.image = UIImage(named: imageName)
    self.contentMode = .scaleAspectFit
  }
  
}
