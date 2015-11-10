//
//  Player.swift
//  Ratings
//
//  Created by Brian J Glowe on 11/10/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import Foundation
import UIKit

struct Player {
    var name: String?
    var game: String?
    var rating: Int
    
    init(name: String?, game: String?, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
    }
}