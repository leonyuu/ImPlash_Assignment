//
//  HomeViewController.swift
//  ImSplash
//
//  Created by Leon Yuu on 4/23/20.
//  Copyright © 2020 Maple Labs. All rights reserved.
//

import UIKit

class BaseViewModel: NSObject {
    weak var rootController: BaseViewController?
    
    func setupView() {
        // Will do task setup views in child class
    }
}
