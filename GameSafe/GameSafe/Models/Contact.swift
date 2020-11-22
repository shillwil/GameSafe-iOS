//
//  Contact.swift
//  GameSafe
//
//  Created by Alex Shillingford on 11/20/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation
import RealmSwift


struct Contact: Hashable, Equatable, Identifiable {
	
	var id: Int
	var name: String
	var phoneNumber: String
	var isMainContact: Bool
	
	init(id: Int, name: String, phoneNumber: String, isMainContact: Bool) {
		self.id = id
		self.name = name
		self.phoneNumber = phoneNumber
		self.isMainContact = isMainContact
	}
	
	static func == (lhs: Contact, rhs: Contact) -> Bool {
		lhs == rhs
	}
}

extension Contact {
	init(realmContact: RealmContact) {
		id = realmContact.id
		name = realmContact.name
		phoneNumber = realmContact.phoneNumber
		isMainContact = realmContact.isMainContact
	}
}
