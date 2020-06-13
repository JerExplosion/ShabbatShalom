//
//  Feasto.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 6/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// let context = UIA

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 



func saveItems() {
    let newFeast = Feasto(context: context)
    
    newFeast.title = "Sample feast"
    newFeast.notes = "Sample notes. Gotta be longer but this will do"
    newFeast.menu = "Mango Lassi. Matcha bubble.  "
    

    do {
        try context.save()
    } catch {
        print("can't save context.  do you copy ")
    }
}
                 
