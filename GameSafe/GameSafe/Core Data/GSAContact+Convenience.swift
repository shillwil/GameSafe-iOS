//
//  GSAContact+Convenience.swift
//  GameSafe
//
//  Created by Alex Shillingford on 8/20/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation
import CoreData

extension GSAContact {
	convenience init(
		name: String,
		phoneNumber: Int,
		isMainContact: Bool,
		context: NSManagedObjectContext = CoreDataStack.shared.mainContext
	) {
		self.init(context: context)
		
		self.name = name
		self.phoneNumber = Int16(phoneNumber)
		self.isMainContact = isMainContact
	}
}
