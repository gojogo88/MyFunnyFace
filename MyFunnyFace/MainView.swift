//
//  MainView.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/07/24.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let bgImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bgImage")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let newGameBtn: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "newGame"), for: .normal)
        button.setAnchor(width: 0, height: 0)
        return button
    }()
    
    let newGameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "ChalkboardSE-Bold", size: 26)
        label.text = "new game"
        label.textColor = UIColor.myBlue
        label.setAnchor(width: 0, height: 0)
        return label
    }()
    
    let galleryBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pictureFrame"), for: .normal)
        button.setAnchor(width: 0, height: 0)
        return button
    }()
    
    let galleryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ChalkboardSE-Bold", size: 26)
        label.text = "gallery"
        label.textColor = UIColor.myBlue
        label.setAnchor(width: 0, height: 0)
        return label
    }()
    
    let narratorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let narratorPic: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "mouthClose")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let chatBubbleView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "chatBubble")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var newGameBtnBgView = ButtonBgView(button: newGameBtn, label: newGameLabel)
    lazy var galleryBtnBgView = ButtonBgView(button: galleryBtn, label: galleryLabel)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    fileprivate func setup() {
        
        var spacing: CGFloat!
        var narrWidth: CGFloat!
        var narrHeight: CGFloat!
        var bubbleWidth: CGFloat!
        var picWidth: CGFloat!
        
        if UIDevice.whichDevice() == iOSDevice.isIpadPro129 {
            spacing = 270
            narrWidth = 1124
            narrHeight = 174
            bubbleWidth = 942
            picWidth = 232
        } else if UIDevice.whichDevice() == iOSDevice.isIpadPro {
            spacing = 220
            narrWidth = 810
            narrHeight = 130
            bubbleWidth = 660
            picWidth = 182
        }
        
        let stackView = mainStackView()
        
        addSubview(bgImageView)
        bgImageView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        setupNarrView(width: narrWidth, height: narrHeight, chatBubbleWidth: bubbleWidth, picWidth: picWidth)
        addSubview(stackView)
        stackView.setAnchor(width: (self.frame.width - spacing), height: (self.frame.width - spacing) / 2.1)
        stackView.setAnchor(top: narratorView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 94, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    
    func mainStackView() -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: [newGameBtnBgView, galleryBtnBgView])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        
        return stackView
    }
    
    func setupNarrView(width: CGFloat, height: CGFloat, chatBubbleWidth: CGFloat, picWidth: CGFloat){
        addSubview(narratorView)
        narratorView.setAnchor(top: self.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 72, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        narratorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        narratorView.setAnchor(width: width, height: height)
        
        addSubview(narratorPic)
        narratorPic.setAnchor(width: picWidth, height: 0)
        narratorPic.setAnchor(top: nil, left: nil, bottom: nil, right: narratorView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 2)
        narratorPic.centerYAnchor.constraint(equalTo: narratorView.centerYAnchor).isActive = true
        
        addSubview(chatBubbleView)
        chatBubbleView.setAnchor(width: chatBubbleWidth, height: 0)
        chatBubbleView.setAnchor(top: narratorView.topAnchor, left: narratorView.leftAnchor, bottom: narratorView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 2, paddingBottom: 0, paddingRight: 0)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
