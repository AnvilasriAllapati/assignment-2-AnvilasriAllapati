//
//  DBManager.swift
//  ProjectBook
//
//  Created by Anvila on 01/11/23.
//

import UIKit
import CoreData
class DBManager
{
    static let share = DBManager()
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ProjectBook")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fetchBookData() -> [BookData]{
        var booksData = [BookData]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: BookData.description())
        do{
            booksData = try context.fetch(fetchRequest) as! [BookData]
        }
        catch{
            print("fetching error")
        }
        return booksData
    }
}
