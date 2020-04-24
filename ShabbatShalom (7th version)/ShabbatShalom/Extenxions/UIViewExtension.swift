//
//  UIViewExtension.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/20/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

//extension UIView {

// 6    func slideInFromLeft(duration: NSTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
// 7        // Create a CATransition animation
// 8        let slideInFromLeftTransition = CATransition()
// 9
//10        // Set its callback delegate to the completionDelegate that was provided (if any)
//11        if let delegate: AnyObject = completionDelegate {
//12            slideInFromLeftTransition.delegate = delegate
//13        }
//14
//15        // Customize the animation's properties
//16        slideInFromLeftTransition.type = kCATransitionPush
//17        slideInFromLeftTransition.subtype = kCATransitionFromLeft
//18        slideInFromLeftTransition.duration = duration
//19        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//20        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
//21
//22        // Add the animation to the View's layer
//23        self.layer.addAnimation(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
//24    }
//25}

extension UIView {
    
    func slidingInFromWherever(duration: TimeInterval, completionDelegate: AnyObject? = nil, whichDirection: CATransitionSubtype) {
        
        let fromWherever = CATransition()
        
        if let delegate: AnyObject = completionDelegate {
            fromWherever.delegate = delegate as! CAAnimationDelegate
        }
        
        fromWherever.type = CATransitionType.fade
        fromWherever.subtype = whichDirection
        fromWherever.duration = duration
        fromWherever.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        fromWherever.fillMode = CAMediaTimingFillMode.removed
        
        self.layer.add(fromWherever, forKey: "fromWherever")

    }
              
        
}
