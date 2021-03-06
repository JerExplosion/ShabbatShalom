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
    
    // MARS: - Generating Context & Container
    
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
    
    // MARS: - Fetchin'
    
    func genericFetch(fetchRequest: NSFetchRequest<NSManagedObject>) -> [NSManagedObject] {
        do {
            let entityArry = try getMainContext().fetch(fetchRequest)
            return entityArry
        } catch {
            print("fetch request failure caught")
            return [NSManagedObject]()
        }
    }
    
    // MARS: - Update \ Delete \ Insert
    
    func update(entity: NSManagedObject, managedObjectContext: NSManagedObjectContext) {
        // to be implemented slightly later
    }
    func delete(entity: NSManagedObject, managedObjectContext: NSManagedObjectContext) {
        managedObjectContext.delete(entity)
    }
    func insert(entity: NSManagedObject, managedObjectContext: NSManagedObjectContext) {
        managedObjectContext.insert(entity)
    }
    
    // MARS: - Regular save
    
    func saveContext() {
        guard let context = persistentContainerSelfGeneration?.viewContext else { return }
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("trouble executing saveContext()")
            }
        }
    }

    // default code derived from AppDelegate - Initialization of PersistentContainer

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
