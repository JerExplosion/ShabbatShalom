//
//  GuestDetailsVC.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/13/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation

class GuestDetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = GlobalConstants.guestDetailsNavigationBarTitle
    }
    
    @IBOutlet weak var guestNameTextField: UITextField!
    
}
