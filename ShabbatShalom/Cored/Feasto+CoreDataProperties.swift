//
//  Feasto+CoreDataProperties.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 6/11/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
//

import Foundation
import CoreData


extension Feasto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Feasto> {
        return NSFetchRequest<Feasto>(entityName: "Feasto")
    }


}
