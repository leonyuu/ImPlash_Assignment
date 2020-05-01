//
//  PhotoDetailsViewModel.swift
//  ImSplash
//
//  Created by Leon Yuu on 4/29/20.
//  Copyright © 2020 Maple Labs. All rights reserved.
//

import UIKit
import UnsplashPhotoPicker
import SDWebImage

class PhotoDetailsViewModel: BaseViewModel {

    weak var imageView: UIImageView?
    weak var userProfileImageView: UIImageView?
    weak var userDisplayNameLabel: UILabel?
    weak var userNameLabel: UILabel?
    weak var imageHeightConstraint: NSLayoutConstraint?
    
    var unsplashPhoto: UnsplashPhoto?
    
    override func setupView() {
        super.setupView()
        
        if let photo = unsplashPhoto {
            // Re-calculate Photo Height
            let width: CGFloat = CGFloat(photo.width)
            let height: CGFloat = CGFloat(photo.height)
            let ratio = height * 1.0 / width
            imageHeightConstraint?.constant =  ratio * UIScreen.main.bounds.size.width
            
            // Load Image
            let urls = photo.urls
            let regularUrl = urls.first(where: { $0.key == .regular })
            
            imageView?.sd_setImage(with: regularUrl?.value,
                                   placeholderImage: UIImage(named: "imsplash_image_empty"))
            
            let user = photo.user
            if let firstName = user.firstName, let lastName = user.lastName {
                // Init Text, Style for User Display Name
                userDisplayNameLabel?.text = "\(firstName) \(lastName)"
                userDisplayNameLabel?.textColor = UIColor(hex: Color.DarkGrayText.rawValue)
                userDisplayNameLabel?.font = UIFont(name: SFUIDisplayFont.Bold.rawValue, size: 17)
            }
            
            // Init Text, Style for User Name
            userNameLabel?.text = "@\(user.username)"
            userNameLabel?.textColor = UIColor(hex: Color.LightGrayText.rawValue)
            userNameLabel?.font = UIFont(name: SFUIDisplayFont.Regular.rawValue, size: 13)
            
            // Set Profile Image
            let profileImages = user.profileImage
            let profileUrl = profileImages.first(where: { $0.key == .medium })
            
            userProfileImageView?.sd_setImage(with: profileUrl?.value,
                                              placeholderImage: UIImage(named: "imsplash_icon_user"))
        }
    }
}
