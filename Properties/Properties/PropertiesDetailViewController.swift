//
//  RecipeDetailViewController.swift
//  BurgerRecipe
//
//  Created by user244165 on 9/12/23.
//  Copyright © 2023 Gregor Pichler. All rights reserved.
//

import UIKit

class PropertiesDetailViewController: UIViewController {
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addressTextView: UITextView!
    
    var properties: Properties!
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerImageView.image = UIImage(named: properties.imageName)
        priceLabel.text = properties.price
        addressTextView.text = properties.address
    }
   
    
    func debugInfo() -> String {
        return "ViewController: \(self)"
    }

  

}
