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
    
    func generateColorWithRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: Float) -> UIColor {
        
        let colorByRGB = UIColor.init(red: red/255, green: CGFloat(green/255), blue: (blue/255), alpha: CGFloat(alpha))

        return colorByRGB
    }
}
         
    
