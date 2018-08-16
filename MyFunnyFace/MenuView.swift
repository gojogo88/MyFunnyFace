//
//  MenuView.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/08/15.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class MenuView: UIView {

  var cancelAction: (() -> Void)?
  
  let bgImageView: UIImageView = {
    let iv = UIImageView(imageName: "settingsBG")
    return iv
  }()
  
  let closeBtn: UIButton = {
    let btn = UIButton(imageName: "closeSettingBtn")
    btn.addTarget(self, action: #selector(handleCloseBtn), for: .touchUpInside)
    return btn
  }()
  
  let closeLbl: UILabel = {
    let label = UILabel(title: "CLOSE", fontName: "ChalkboardSE-Bold", fontSize: 30, color: .gray)
    return label
  }()
  
  let menuTitle: UILabel = {
    let label = UILabel(title: "CLOSE", fontName: "ChalkboardSE-Bold", fontSize: 30, color: .menuTextColor)
    return label
  }()
  
  let textbg: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 195/255, green: 110/255, blue: 53/255, alpha: 1)
    return view
  }()
  
  let textbg1: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 195/255, green: 110/255, blue: 53/255, alpha: 1)
    return view
  }()
  
  let textbg2: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 195/255, green: 110/255, blue: 53/255, alpha: 1)
    return view
  }()
  
  let langSelectLbl: UILabel = {
    let label = UILabel(title: "Language Selection", fontName: "ChalkboardSE-Bold", fontSize: 36, color: .menuTextColor)
    return label
  }()
  
  let retToGameLbl: UILabel = {
    let label = UILabel(title: "Return to this game's main menu", fontName: "ChalkboardSE-Bold", fontSize: 36, color: .menuTextColor)
    return label
  }()

  let retToAppLbl: UILabel = {
    let label = UILabel(title: "Return to main app menu", fontName: "ChalkboardSE-Bold", fontSize: 36, color: .menuTextColor)
    return label
  }()

  let engBtn: UIButton = {
    let btn = UIButton(imageName: "engLangBtn")
    btn.addTarget(self, action: #selector(handleEngLang), for: .touchUpInside)
    return btn
  }()

  let japBtn: UIButton = {
    let btn = UIButton(imageName: "jpnLangBtn")
    btn.addTarget(self, action: #selector(handleJapLang), for: .touchUpInside)
    return btn
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
    
  }
  
  fileprivate func setup() {
    
    var settingsWidth: CGFloat!
    var settingsHeight: CGFloat!
    var textBGSideSpacing: CGFloat!
    var textBGTopSpacing: CGFloat!
    var textBGHeight: CGFloat!
    var flagSpacing: CGFloat!
    var topSpacing: CGFloat!
    
    if UIDevice.whichDevice() == iOSDevice.isIpadPro129 {
      settingsWidth = 1000
      settingsHeight = 800
      textBGHeight = 70
      textBGSideSpacing = 120
      textBGTopSpacing = 120
      topSpacing = 40
      flagSpacing = 40
    } else {
      settingsWidth = 800
      settingsHeight = 600
      textBGHeight = 60
      textBGSideSpacing = 80
      textBGTopSpacing = 90
      topSpacing = 20
      flagSpacing = 10
    }
    
    let stackView = createHorizontalStackView(views: [engBtn, japBtn])
    
    backgroundColor = UIColor(white: 0.1, alpha: 0.7)
    self.addSubview(bgImageView)
    bgImageView.setAnchor(width: settingsWidth, height: settingsHeight)
    bgImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    bgImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
    bgImageView.addSubview(textbg)
    textbg.setAnchor(top: bgImageView.topAnchor, left: bgImageView.leftAnchor, bottom: nil, right: bgImageView.rightAnchor, paddingTop: textBGTopSpacing, paddingLeft: textBGSideSpacing, paddingBottom: 0, paddingRight: textBGSideSpacing)
    textbg.setAnchor(width: 0, height: textBGHeight)
    textbg.layer.cornerRadius = textBGHeight / 2
    
    textbg.addSubview(langSelectLbl)
    langSelectLbl.centerXAnchor.constraint(equalTo: textbg.centerXAnchor).isActive = true
    langSelectLbl.centerYAnchor.constraint(equalTo: textbg.centerYAnchor).isActive = true
    
    textbg.addSubview(stackView)
    stackView.setAnchor(top: langSelectLbl.bottomAnchor, left: textbg.leftAnchor, bottom: nil, right: textbg.rightAnchor, paddingTop: flagSpacing, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    
    bgImageView.addSubview(textbg1)
    textbg1.setAnchor(top: stackView.bottomAnchor, left: bgImageView.leftAnchor, bottom: nil, right: bgImageView.rightAnchor, paddingTop: topSpacing - 10, paddingLeft: textBGSideSpacing, paddingBottom: 0, paddingRight: textBGSideSpacing)
    textbg1.setAnchor(width: 0, height: textBGHeight)
    textbg1.layer.cornerRadius = textBGHeight / 2
    
    textbg1.addSubview(retToGameLbl)
    retToGameLbl.centerXAnchor.constraint(equalTo: textbg1.centerXAnchor).isActive = true
    retToGameLbl.centerYAnchor.constraint(equalTo: textbg1.centerYAnchor).isActive = true
    
    bgImageView.addSubview(textbg2)
    textbg2.setAnchor(top: textbg1.bottomAnchor, left: bgImageView.leftAnchor, bottom: nil, right: bgImageView.rightAnchor, paddingTop: topSpacing, paddingLeft: textBGSideSpacing, paddingBottom: 0, paddingRight: textBGSideSpacing)
    textbg2.setAnchor(width: 0, height: textBGHeight)
    textbg2.layer.cornerRadius = textBGHeight / 2
    
    textbg2.addSubview(retToAppLbl)
    retToAppLbl.centerXAnchor.constraint(equalTo: textbg2.centerXAnchor).isActive = true
    retToAppLbl.centerYAnchor.constraint(equalTo: textbg2.centerYAnchor).isActive = true
    
    self.addSubview(closeBtn)
    closeBtn.setAnchor(top: nil, left: nil, bottom: self.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 5)
    closeBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
    self.addSubview(closeLbl)
    closeLbl.setAnchor(top: nil, left: nil, bottom: closeBtn.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 6, paddingRight: 0)
    closeLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
  }
  
  @objc func handleCloseBtn() {
    cancelAction?()
  }
  
  @objc func handleEngLang() {
    
  }
  
  @objc func handleJapLang() {
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
