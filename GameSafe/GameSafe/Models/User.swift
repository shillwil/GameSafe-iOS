//
//  User.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/21/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var contacts: [Contact]
    var easyDiff, mediumDiff, hardDiff: Difficulty
    var currentLocation: (Double, Double)
}
