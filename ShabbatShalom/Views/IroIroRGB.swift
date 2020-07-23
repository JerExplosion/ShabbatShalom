//
//  IroIroRGB.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 7/22/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func generateColorWithRGB(red: Int, green: Int, blue: Int, alpha: Float) -> UIColor {
        
        let colorByRGB = UIColor.init(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: CGFloat(alpha))

        return colorByRGB
    }
}
