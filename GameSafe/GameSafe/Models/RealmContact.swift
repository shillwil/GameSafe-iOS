//
//  RealmContact.swift
//  GameSafe
//
//  Created by Alex Shillingford on 11/20/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation
import RealmSwift

class RealmContact: Object {
	@objc dynamic var id = 0
	@objc dynamic var name = ""
	@objc dynamic var phoneNumber = ""
	@objc dynamic var isMainContact = false
}
