//
//  SunsetModel.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 3/14/22.
//

import Foundation

struct JSONResponse: Codable {
    var results: Results
}

struct Results: Codable {
    var sunrise: String
    var sunset: String
    var dayLength: String
}
