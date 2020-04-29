//
//  PhotoDetailsViewController.swift
//  ImSplash
//
//  Created by Leon Yuu on 4/22/20.
//  Copyright © 2020 Maple Labs. All rights reserved.
//

import UIKit
import UnsplashPhotoPicker

class PhotoDetailsViewController: BaseViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    @IBAction func onCloseBtn() {
        navigationController?.popViewController(animated: true)
    }
    
    var unsplashPhoto: UnsplashPhoto?
    
    lazy var photoDetailsViewModel: PhotoDetailsViewModel = {
        let model = PhotoDetailsViewModel()
        model.imageView = imageView
        model.unsplashPhoto = unsplashPhoto
        model.imageHeightConstraint = imageHeightConstraint
        model.rootController = self
        return model
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoDetailsViewModel.setupView()
    }

}
