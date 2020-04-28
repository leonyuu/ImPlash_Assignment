//
//  AppDelegate.swift
//  ImSplash
//
//  Created by Leon Yuu on 4/22/20.
//  Copyright © 2020 Maple Labs. All rights reserved.
//

import UIKit

enum UnsplashKey: String {
    case access = "e7bed9e3136d68e997b74de773f2202b9ec3b7710a99a8777d9625c3ac195e90"
    case secret = "f6771c2f9c3cb3ec03e93a3d37803b790ddd294dfd3bc790d39f248e92aabac6"
}

enum SFUIDisplayFont: String {
    case regular = "SFUIDisplay-Regular"
    case heavy = "SFUIDisplay-Heavy"
    case light = "SFUIDisplay-Light"
}

enum Color: String {
    case DarkGrayText = "#FF323946"
}

class GeneralManager {
    static let shared = GeneralManager()
    
    // MARK: Check Internet Connection
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    // MARK: Create UI Alert Controller
    func createAlert(_ style: UIAlertController.Style,
                     _ title: String?,
                     _ message: String?,
                     _ actions: Array<UIAlertAction>?) -> UIAlertController? {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: style)
        if let actions = actions {
            actions.forEach { action in
                alert.addAction(action)
            }
        }
        return alert
    }
    
    // MARK: Print Fonts Name
    func printFonts() {
        for familyName in UIFont.familyNames {
            debugPrint("\n-- \(familyName) \n")
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                debugPrint(fontName)
            }
        }
    }
    
}
