//
//  BurgerModel.swift
//  BurgerRecipe
//
//  Created by Gregor Pichler on 25.01.20.
//  Copyright © 2020 Gregor Pichler. All rights reserved.
//

import Foundation

class PropertiesModel {
    
    private(set) var properties: [Properties] = []
    
    init() {
        if let url = Bundle.main.url(forResource: "PropertyResources/property", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                properties = try JSONDecoder().decode([Properties].self, from: data)
                
            } catch {
                print(error)
            }
        }
    }
    
    func properties(forType type: PropertiesType?) -> [Properties] {
        guard let type = type else { return properties }
        return properties.filter { $0.type == type }
    }
    
    func add(property: Properties){
        properties.append(property)
    }
}
