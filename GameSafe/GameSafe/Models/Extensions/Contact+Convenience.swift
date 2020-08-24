//
//  Contact+Convenience.swift
//  GameSafe
//
//  Created by Alex Shillingford on 8/20/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation

extension Contact {
	init(_ contact: GSAContact) {
		self.name = contact.name ?? "Contact"
		self.phoneNumber = String(contact.phoneNumber)
		self.isMainContact = contact.isMainContact
	}
}
