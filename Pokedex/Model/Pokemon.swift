//
//  Pokemon.swift
//  Pokedex
//
//  Created by Code Red on 13/07/19.
//  Copyright © 2019 particular. All rights reserved.
//

import Foundation

struct Pokemon : Codable {
    var id: Int?
    var name: String?
    var type: String?
    var urlImage: String?
    var description: String?
}
