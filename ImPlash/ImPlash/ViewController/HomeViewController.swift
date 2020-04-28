//
//  HomeViewController.swift
//  ImSplash
//
//  Created by Leon Yuu on 4/21/20.
//  Copyright © 2020 Maple Labs. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    @IBAction func onDownloadBtn() {
        
    }
    
    lazy var homeViewModel: HomeViewModel = {
        let model = HomeViewModel()
        model.titleLabel = titleLabel
        model.descriptionLabel = descriptionLabel
        model.containerView = containerView
        model.rootController = self
        return model
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Navigation Controller for VC Manager
        if VCManager.shared.navigationController == nil { VCManager.shared.navigationController = navigationController }
        
        homeViewModel.setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeViewModel.addPhotoViewController()
    }
    
}
