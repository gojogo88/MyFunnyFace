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
    label.textColor = .myBlue
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
    label.textColor = .myBlue
    label.setAnchor(width: 0, height: 0)
    return label
  }()
  
  let introView: UIView = {
    let narrView = UIView()
    narrView.backgroundColor = .red
    return narrView
  }()
  
  let narratorPic: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "mouthClose")
    iv.contentMode = .scaleAspectFit
    return iv
  }()
  
  
  let chatBubbleBg: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "chatBubble")
    iv.contentMode = .scaleAspectFit
    iv.alpha = 0
    return iv
  }()
  
  let welcomeLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont(name: "ChalkboardSE-Bold", size: 60)
    lbl.textColor = .black
    lbl.textAlignment = .center
    lbl.text = ""
    return lbl
  }()
  
  lazy var newGameBtnBgView = ButtonBgView(button: newGameBtn, label: newGameLabel)
  lazy var galleryBtnBgView = ButtonBgView(button: galleryBtn, label: galleryLabel)
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
    
  }
  
  fileprivate func setup() {
    
    var spacing: CGFloat!
    var bottomHeight: CGFloat!
    var narrWidth: CGFloat!
    var narrHeight: CGFloat!
    
    if UIDevice.whichDevice() == iOSDevice.isIpadPro129 {
      spacing = 270
      bottomHeight = 152
      narrWidth = 1124
      narrHeight = 174
    } else {
      spacing = 220
      bottomHeight = 110
      narrWidth = 840
      narrHeight = 130
    }
    
    let stackView = mainStackView()
    
    self.addSubview(bgImageView)
    bgImageView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    
    self.addSubview(introView)
    introView.setAnchor(width: narrWidth, height: narrHeight)
    introView.setAnchor(top: self.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 72, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    introView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
    introView.addSubview(narratorPic)
    narratorPic.setAnchor(top: introView.topAnchor, left: nil, bottom: introView.bottomAnchor, right: introView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    
    introView.addSubview(chatBubbleBg)
    chatBubbleBg.setAnchor(top: introView.topAnchor, left: introView.leftAnchor, bottom: introView.bottomAnchor, right: introView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 170)
    
    chatBubbleBg.addSubview(welcomeLabel)
    welcomeLabel.setAnchor(top: chatBubbleBg.topAnchor, left: chatBubbleBg.leftAnchor, bottom: chatBubbleBg.bottomAnchor, right: chatBubbleBg.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 50)
    
    UIView.animate(withDuration: 0.1) {
      self.introView.alpha = 0
      self.chatBubbleBg.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
      self.introView.transform = CGAffineTransform(translationX: 0, y: -narrHeight)
    }
    
    UIView.animate(withDuration: 1.5, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
      self.introView.alpha = 1
      
      self.introView.transform = .identity
    }) { (finished) in
      UIView.animate(withDuration: 1, delay: 0.2, options: [], animations: {
        self.chatBubbleBg.alpha = 1
        self.chatBubbleBg.transform =  .identity
      }, completion: { (finished) in
        self.animateWelcomeText()
      })
    }
    
    self.addSubview(stackView)
    stackView.setAnchor(width: (self.frame.width - spacing), height: (self.frame.width - spacing) / 2.1)
    stackView.setAnchor(top: nil, left: nil, bottom: bgImageView.bottomAnchor, right: nil, paddingTop: 94, paddingLeft: 0, paddingBottom: -bottomHeight, paddingRight: 0)
    stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
  }
  
  func mainStackView() -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: [newGameBtnBgView, galleryBtnBgView])
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    stackView.spacing = 20
    
    return stackView
  }
  
  fileprivate func animateWelcomeText() {
    let textToAnimate1 = "Welcome"
    let textToAnimate2 = "Please make a selection"
    
    for char in textToAnimate1 {
      welcomeLabel.text! += "\(char)"
      RunLoop.current.run(until: Date()+0.18)
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
      
      UIView.animate(withDuration: 1, animations: {
        self.welcomeLabel.text = ""
      }, completion: { (finished) in
        for char in textToAnimate2 {
          self.welcomeLabel.text! += "\(char)"
          RunLoop.current.run(until: Date()+0.15)
        }
      })
      
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
