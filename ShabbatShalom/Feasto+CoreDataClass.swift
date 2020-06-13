//
//  Feasto+CoreDataClass.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 6/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
//

import Foundation
import CoreData


public class Feasto: NSManagedObject {
    var title: String = "OG title"   // in the xcdatamodel, keeping them as optinal first but can be un-checked
    var menu: String = "OG menu"
    var notes: String = "OG notes"
}
    
 
