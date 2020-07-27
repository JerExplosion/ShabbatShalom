//
//  CoreDataDataCore.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 7/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import CoreData
import UIKit

class CoreDataM {
    
    static let shared = CoreDataM.init()
    
    private init() { }
    
    var persistentContainerSelfGeneration: NSPersistentContainer?
    
    func getMainContext() -> NSManagedObjectContext {
        
        var nsmoContext = NSManagedObjectContext()
        
        if let persistentContainer = persistentContainerSelfGeneration {
            nsmoContext = persistentContainer.viewContext
        }
        return nsmoContext
    }
    
    func setupPersistentContainer(datamodelName: String) {
        let container = NSPersistentContainer(name: datamodelName)
        
        container.loadPersistentStores { (storeDescription, error) in
            print("Store description's configuration is: \(storeDescription.configuration)")
            print("error's debugDesription is: \(error.debugDescription)")
        }
    }
    

    // default code derived from AppDelegate

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "ShabuShabuDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
}
