//
//  CoreDataStack.swift
//  GameSafe
//
//  Created by Alex Shillingford on 8/20/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation
import CoreData

import CoreData
// Contain all of the setup of the NSPersistentContainer
class CoreDataStack {
	
	static let shared = CoreDataStack()
	
	private init() {
		
	}
	
	lazy var container: NSPersistentContainer = {
		
		let container = NSPersistentContainer(name: "ContactModel")
		container.loadPersistentStores(completionHandler: { (_, error) in
			if let error = error {
				fatalError("Failed to load persistent stores: \(error)")
			}
		})
		container.viewContext.automaticallyMergesChangesFromParent = true
		return container
	}()
	
	var mainContext: NSManagedObjectContext {
		return container.viewContext
	}
	
	func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
		context.performAndWait {
			do {
				try context.save()
			} catch {
				NSLog("Error saving context: \(error)")
				context.reset()
			}
		}
	}
}

