//
//  UIButton+Extension.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/07/24.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

/*
extension UIButton {
    func centerTextWithImage (margin:CGFloat) {
        var width = self.frame.width
        var imgWidth = self.imageView!.frame.width as CGFloat
        var txt = self.titleLabel!.text
        //var textSize = self.titleLabel!.sizeOfString(txt!, height: Double(self.frame.height)) as CGSize
        
        //var spacing = (width - (imgWidth + textSize.width)) / 2
        //self.imageEdgeInsets = UIEdgeInsetsMake(0, margin, 0, spacing);
        //self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing + (margin/2), 0, 0);
    }
}
*/



extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    
}
 
