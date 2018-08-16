//
//  MenuVC.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/08/15.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
  
  var menuView: MenuView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
  }
  
  fileprivate func setupView() {
    let menuVCView = MenuView(frame: self.view.frame)
    menuView = menuVCView
    view.addSubview(menuView)
    menuView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    
    menuVCView.cancelAction = cancelPressed
  }

  fileprivate func cancelPressed() {
    dismiss(animated: true, completion: nil)
  }
}
