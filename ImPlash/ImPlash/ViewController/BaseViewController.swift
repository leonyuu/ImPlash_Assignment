//
//  HomeViewController.swift
//  ImSplash
//
//  Created by Leon Yuu on 4/21/20.
//  Copyright © 2020 Maple Labs. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var tapGesture: UITapGestureRecognizer?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Support functions
    func initBgGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        if tapGesture != nil { view.addGestureRecognizer(tapGesture!) }
    }
    
    func removeBgGesture() {
        if tapGesture != nil { view.removeGestureRecognizer(tapGesture!) }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

