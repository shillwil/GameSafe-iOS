//
//  Difficulty.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/14/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation

enum DifficultyLevel {
    case easy
    case medium
    case hard
}

struct Difficulty {
    let level: DifficultyLevel
    var message: String
}
