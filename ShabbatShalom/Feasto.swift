//
//  Feasto.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 6/13/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// let context = UIA

let universalContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

var universalFeastoArray = [Feasto]()
     

func coreDataCreate() {
    let newFeast = Feasto(context: universalContext)
    
    newFeast.title = "Sample feast"
    newFeast.notes = "Sample notes. Gotta be longer but this will do"
    newFeast.menu = "Mango Lassi. Matcha bubble.  "
    universalFeastoArray.append(newFeast)
    do {
        try universalContext.save()
    } catch {
        print("can't save context.  do you copy ")
    }
    print(universalFeastoArray)
}

func coreDataSave() {

    do {
        try universalContext.save()
    } catch {
        print("can't save context.  do you copy ")
    }
    
    // self.eventsTable.reloadData()
}

func coreDataLoad() {
    
    let request: NSFetchRequest<Feasto> = Feasto.fetchRequest()
    
    do {
         universalFeastoArray =  try universalContext.fetch(request)
        print(universalFeastoArray[0].title)
    }
    catch {
        print("Error fetching data from context bud ")
    } 
}              





// saveItems should be called inside the create() action 

