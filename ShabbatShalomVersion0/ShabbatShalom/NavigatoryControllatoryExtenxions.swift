//
//  NavigatoryControllatoryExtenxions.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit


extension UINavigationController {
    func crossDissolve(_ viewController: UIViewController) {
        
        let cdTransition = CATransition()
        cdTransition.duration = 0.33
        cdTransition.type = CATransitionType.fade
        view.layer.add(cdTransition, forKey: nil)
        pushViewController(viewController, animated: false)
        
    }
}

 
