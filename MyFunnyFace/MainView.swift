//
//  MainView.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/07/24.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class MainView: UIView {
  
  var settingsAction: (() -> Void)?
  
  let bgImageView: UIImageView = {
    let iv = UIImageView(imageName: "bgImage")
    return iv
  }()
  
  let newGameBtn: UIButton = {
    let btn = UIButton(imageName: "newGame")
    btn.addTarget(self, action: #selector(handleNewGame), for: .touchUpInside)
    return btn
  }()
  
  let newGameLabel: UILabel = {
    let label = UILabel(title: "gallery", fontName: "ChalkboardSE-Bold", fontSize: 26, color: .myBlue)
    return label
  }()
  
  let galleryBtn: UIButton = {
    let btn = UIButton(imageName: "pictureFrame")
    btn.addTarget(self, action: #selector(handleGallery), for: .touchUpInside)
    return btn
  }()
  
  let galleryLabel: UILabel = {
    let label = UILabel(title: "new game", fontName: "ChalkboardSE-Bold", fontSize: 26, color: .myBlue)
    return label
  }()
  
  let introView: UIView = {
    let narrView = UIView()
    narrView.backgroundColor = .clear
    return narrView
  }()
  
  let narratorPic: UIImageView = {
    let iv = UIImageView(imageName: "mouthClose")
    return iv
  }()
  
  let chatBubbleBg: UIImageView = {
    let iv = UIImageView(imageName: "chatBubble")
    iv.alpha = 0
    return iv
  }()
  
  let welcomeLabel = UILabel.mainText
  
  let settingsBtn: UIButton = {
    let btn = UIButton()
    btn.setImage(UIImage(named: "showSettingBtn"), for: .normal)
    btn.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
    return btn
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
      welcomeLabel.font = UIFont(name: "ChalkboardSE-Bold", size: 70)
    } else {
      spacing = 220
      bottomHeight = 110
      narrWidth = 840
      narrHeight = 130
      welcomeLabel.font = UIFont(name: "ChalkboardSE-Bold", size: 50)
    }
    
    let stackView = createHorizontalStackView(views: [newGameBtnBgView, galleryBtnBgView])
    
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
    
    self.addSubview(settingsBtn)
    settingsBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    settingsBtn.setAnchor(top: nil, left: nil, bottom: self.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
  }
  
  fileprivate func animateWelcomeText() {
    let textToAnimate1 = "Welcome"
    let textToAnimate2 = "Please make a selection"
    
    self.narratorPic.animationImages = [UIImage(named: "mouthClose")!, UIImage(named: "mouthOpen")!]
    self.narratorPic.animationDuration = 0.5
    self.narratorPic.animationRepeatCount = 2
    
    self.narratorPic.startAnimating()
    
    for char in textToAnimate1 {
      self.welcomeLabel.text! += "\(char)"
      RunLoop.current.run(until: Date()+0.18)
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
      
      self.narratorPic.animationImages = [UIImage(named: "mouthClose")!, UIImage(named: "mouthOpen")!]
      self.narratorPic.animationDuration = 0.5
      self.narratorPic.animationRepeatCount = 7
      
      self.narratorPic.startAnimating()
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
  
  
  @objc func handleNewGame() {
    
  }
  
  @objc func handleGallery() {
    
  }
  
  @objc func handleSettings() {
    settingsAction?()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
