//
//  PhotoDetailsViewController.swift
//  ImSplash
//
//  Created by Leon Yuu on 4/22/20.
//  Copyright © 2020 Maple Labs. All rights reserved.
//

import UIKit
import Toast_Swift
import UnsplashPhotoPicker

class PhotoDetailsViewController: BaseViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userDisplayNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    @IBAction func onCloseBtn() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onDownloadBtn() {
        view.makeToast("Download is coming soon!")
    }
    
    @IBAction func onFavouriteBtn() {
        view.makeToast("Favorite is coming soon!")
    }
    
    var unsplashPhoto: UnsplashPhoto?
    
    lazy var photoDetailsViewModel: PhotoDetailsViewModel = {
        let model = PhotoDetailsViewModel()
        model.imageView = imageView
        model.userProfileImageView = userProfileImageView
        model.userDisplayNameLabel = userDisplayNameLabel
        model.userNameLabel = userNameLabel
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
