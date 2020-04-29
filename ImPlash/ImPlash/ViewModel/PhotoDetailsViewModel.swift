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
    weak var imageHeightConstraint: NSLayoutConstraint?
    
    var unsplashPhoto: UnsplashPhoto?
    
    override func setupView() {
        super.setupView()
        
        if let photo = unsplashPhoto {
            let urls = photo.urls
            let width: CGFloat = CGFloat(photo.width)
            let height: CGFloat = CGFloat(photo.height)
            
            // Re-calculate Photo Height
            let ratio = height * 1.0 / width
            imageHeightConstraint?.constant =  ratio * UIScreen.main.bounds.size.width
            
            // Load Image
            let regularUrl = urls.first(where: { $0.key == .regular })
            
            imageView?.sd_setImage(with: nil,
                                   placeholderImage: UIImage(named: "imsplash_image_empty"))
        }
    }
}
