//
//  FavouritesTableViewCell.swift
//  Properties
//
//  Created by user244165 on 10/3/23.
//  Copyright © 2023 Gregor Pichler. All rights reserved.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ThumnailImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        ThumnailImageView.layer.cornerRadius = 4
    }

}
