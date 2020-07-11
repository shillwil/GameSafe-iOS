//
//  Contact.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation
import Contacts

struct Contact: Hashable {
    var name: String
    var phoneNumber: String
    var isMainContact: Bool
}
