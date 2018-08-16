//
//  ViewController.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/07/24.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        //to get all the fonts in the system
      /*
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
 */
    }

    fileprivate func setupView() {
        let mainVCView = MainView(frame: self.view.frame)
        mainView = mainVCView
        view.addSubview(mainView)
        mainView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
      
      mainView.settingsAction = settingsPressed
    }

  fileprivate func settingsPressed() {
    let menuVC = MenuVC()
    present(menuVC, animated: true, completion: nil)
  }
  
}

