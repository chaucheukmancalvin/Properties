//
//  Burger.swift
//  BurgerRecipe
//
//  Created by Gregor Pichler on 25.01.20.
//  Copyright © 2020 Gregor Pichler. All rights reserved.
//

import Foundation

struct Properties: Decodable {
    var address: String
    var price: String
    var imageName: String
    var thumbnailName: String
    var type: PropertiesType
}

enum PropertiesType: String, Decodable {
    case house = "House"
    case unit = "Unit"
    case land = "Land"
}
