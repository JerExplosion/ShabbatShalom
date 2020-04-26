//
//  SubsequentViewController.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation

class SubsequentViewController: UIViewController {
    @IBOutlet weak var guestProfilePicImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //    navigationItem.title = GlobalConstants.subsequentNavigationBarTitle
        
        guestProfilePicImageView.layer.cornerRadius = 25
        guestProfilePicImageView.clipsToBounds = true
        
        
    }
}
