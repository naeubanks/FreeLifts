//
//  DataController.swift
//  FreeLifts
//
//  Created by Nick Eubanks on 10/17/16.
//  Copyright © 2016 Nick Eubanks. All rights reserved.
//

import CoreData

class DataController : NSObject {
    
    // TODO: Replace fatal errors
    var restTimerStart : Date?
    var isLastSetSuccess : Bool = true
    
    func fetchActiveParticipant() -> Participant {
        do {
            let fetchedParticipants = try persistentContainer.viewContext.fetch(Participant.fetchRequest())
            if (fetchedParticipants.count == 1) {
                return fetchedParticipants[0] as! Participant
            }
        } catch {
            fatalError("Failed to fetch participant: \(error)")
        }
        
        let newParticipant = NSEntityDescription.insertNewObject(forEntityName: "Participant", into: persistentContainer.viewContext) as! Participant
        return newParticipant
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
