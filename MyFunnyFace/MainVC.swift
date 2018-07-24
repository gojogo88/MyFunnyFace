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

        view.backgroundColor = .red
        
        setupView()
    }

    fileprivate func setupView() {
        let mainVCView = MainView(frame: self.view.frame)
        mainView = mainVCView
        view.addSubview(mainView)
        mainView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }


}

