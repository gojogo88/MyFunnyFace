//
//  ButtonBgView.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/07/31.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class ButtonBgView: UIView {

    let button: UIButton
    let label: UILabel
    
    init(button: UIButton, label: UILabel) {
        self.button = button
        self.label = label
        super.init(frame: .zero)
        
        backgroundColor = UIColor.clear
        layer.borderWidth = 7
        layer.cornerRadius = 5
        
        addSubview(button)
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        addSubview(label)
        label.setAnchor(top: button.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 0)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
