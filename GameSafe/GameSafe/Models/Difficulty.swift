//
//  Difficulty.swift
//  GameSafe
//
//  Created by Alex Shillingford on 7/14/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import Foundation

enum DifficultyLevel: String {
    
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

struct Difficulty: Identifiable, Hashable {
    var id = UUID()
    
    let level: DifficultyLevel
    var message: String
}
