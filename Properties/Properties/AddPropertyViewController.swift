//
//  AddPropertyViewController.swift
//  Properties
//
//  Created by user244165 on 10/3/23.
//  Copyright © 2023 Gregor Pichler. All rights reserved.
//

import UIKit

protocol AddProertiesDelegate {
    func add(property: Properties)
}

class AddPropertyViewController: UIViewController {

    @IBOutlet weak var typeTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var addressTextView: UITextView!
    
    var delegate: AddProertiesDelegate?
    
    let addressPlaceholder = "Add address"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTextView.text = addressPlaceholder
        addressTextView.delegate = self
    }
    @IBAction func didTabCancel(_ sender: Any) {
        dismiss(animated: true)
    }
        
    @IBAction func didTabSave(_ sender: Any) {
        guard let proType = typeTextField.text else {return}
        guard let price = priceTextField.text else {return}
        guard let address = addressTextView.text else {return}
        var pType = PropertiesType.house
        if proType == "House"{
           pType = PropertiesType.house
        }
        else if proType == "Unit"{
            pType = PropertiesType.unit
        }
        else if proType == "Land"{
            pType = PropertiesType.land
        }
        else{
            return
        }
        let newProperty = Properties(address: address, price: price, imageName: "", thumbnailName: "", type: pType)
        delegate?.add(property: newProperty)
        dismiss(animated: true)
    }
    
}
   
extension AddPropertyViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.tertiaryLabel{
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = addressPlaceholder
            textView.textColor = UIColor.tertiaryLabel
        }
    }
    
}
