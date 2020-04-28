//
//  AppDelegate.swift
//  ImSplash
//
//  Created by Leon Yuu on 4/21/20.
//  Copyright © 2020 Maple Labs. All rights reserved.
//

import UIKit

// MARK: Story Board Name
enum StoryBoard: String {
    case Main
}

// MARK: View Controller Name
enum VCName: String {
    case Home = "HomeViewController"
    case Photo = "PhotosViewController"
    case PhotoDetails = "PhotoDetailsViewController"
}

class VCManager {
    
    static let shared = VCManager()
    
    var navigationController: UINavigationController?
    
    func getVC(storyBoard: StoryBoard, vcName: VCName) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyBoard.rawValue, bundle: nil)
        let controllerName = vcName.rawValue
        
        let controller = storyboard.instantiateViewController(withIdentifier: controllerName)
        return controller
    }
    
    func getCurrentController() -> BaseViewController? {
        guard let nav = navigationController else { return nil }
        return nav.topViewController as? BaseViewController
    }
    
}
