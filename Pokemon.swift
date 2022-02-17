//
//  Pokemon.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 2/17/22.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let id: Int
    let sprites: SpriteSheet
}

struct SpriteSheet: Codable {
    let frontDefault: URL
}
