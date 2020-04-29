//
//  HomeViewController.swift
//  ImSplash
//
//  Created by Leon Yuu on 4/23/20.
//  Copyright © 2020 Maple Labs. All rights reserved.
//

import UIKit
import UnsplashPhotoPicker

class HomeViewModel: BaseViewModel {
    
    weak var titleLabel: UILabel?
    weak var descriptionLabel: UILabel?
    weak var containerView: UIView?
    
    var unsplashPhotoPicker: UnsplashPhotoPicker?
    
    override func setupView() {
        super.setupView()
        
        // Init Text, Style for Title Label
        titleLabel?.text = "Unsplash"
        titleLabel?.textColor = UIColor(hex: Color.DarkGrayText.rawValue)
        titleLabel?.font = UIFont(name: SFUIDisplayFont.heavy.rawValue, size: 32)
        
        // Init Text, Style for Description Label
        descriptionLabel?.text = "Beautiful, free photos."
        descriptionLabel?.textColor = UIColor(hex: Color.DarkGrayText.rawValue)
        descriptionLabel?.font = UIFont(name: SFUIDisplayFont.regular.rawValue, size: 17)
    }
    
    func addPhotoViewController() {
        let queryText = "Girl"
        let configuration = UnsplashPhotoPickerConfiguration(
            accessKey: UnsplashKey.access.rawValue,
            secretKey: UnsplashKey.secret.rawValue,
            query: queryText,
            allowsMultipleSelection: false
        )
        unsplashPhotoPicker = UnsplashPhotoPicker(configuration: configuration)
        unsplashPhotoPicker?.photoPickerDelegate = self
        unsplashPhotoPicker?.isNavigationBarHidden = true
        
        guard let photoVC = unsplashPhotoPicker,
            let rootController = rootController,
            let containerView = containerView,
            containerView.subviews.isEmpty else { return }
        
        photoVC.view.frame = CGRect(x: 0,
                                    y: 0,
                                    width: containerView.frame.size.width,
                                    height: containerView.frame.size.height)
        photoVC.willMove(toParent: rootController)
        containerView.addSubview(photoVC.view)
        rootController.addChild(photoVC)
        photoVC.didMove(toParent: rootController)
    }
    
}

// MARK: - UnsplashPhotoPickerDelegate
extension HomeViewModel: UnsplashPhotoPickerDelegate {
    func unsplashPhotoPicker(_ photoPicker: UnsplashPhotoPicker, didSelectPhotos photos: [UnsplashPhoto]) {
        debugPrint("Unsplash photo picker did select \(photos.count) photo(s)")
        
        // Handle Single Photo
        guard let photoDetailsVC = VCManager.shared.getVC(storyBoard: .Main, vcName: .PhotoDetails) as? PhotoDetailsViewController else { return }
        photoDetailsVC.unsplashPhoto = photos.first ?? nil
        rootController?.navigationController?.pushViewController(photoDetailsVC, animated: true)
    }

    func unsplashPhotoPickerDidCancel(_ photoPicker: UnsplashPhotoPicker) {
        debugPrint("Unsplash photo picker did cancel")
    }
}
