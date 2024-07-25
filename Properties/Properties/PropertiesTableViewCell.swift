//
//  RecipeTableViewCell.swift
//  BurgerRecipe
//
//  Created by user244165 on 9/19/23.
//  Copyright © 2023 Gregor Pichler. All rights reserved.
//

import UIKit

class PropertiesTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 4
    }

}
