//
//  ApiResponse.swift
//  Pokedex
//
//  Created by Code Red on 13/07/19.
//  Copyright © 2019 particular. All rights reserved.
//

import Foundation

struct ApiResponse : Codable {
    var pokemons: Array<Pokemon>?
}
