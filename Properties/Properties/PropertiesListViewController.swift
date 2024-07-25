//
//  RecipesListViewController.swift
//  BurgerRecipe
//
//  Created by Gregor Pichler on 11.01.20.
//  Copyright © 2020 Gregor Pichler. All rights reserved.
//

import UIKit

class PropertiesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model = PropertiesModel()
    var selectedType: PropertiesType?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 80
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPropertyDetail" {
            if let indexPath  = tableView.indexPathForSelectedRow {
                let properties = model.properties[indexPath.row]
                let detailVC = segue.destination as? PropertiesDetailViewController
                detailVC?.properties = properties
            }
        }
        if segue.identifier == "AddProperties" {
            if let navVC = segue.destination as? UINavigationController,
                   let addVC = navVC.viewControllers.first as? AddPropertyViewController {
                    addVC.delegate = self // Set the delegate
                }
        }
    }
    
    @IBAction func didChangeFilter(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            selectedType = nil
        case 1:
            selectedType = .house
        case 2:
            selectedType = .unit
        case 3:
            selectedType = .land
        default:
            break
        }
        
        tableView.reloadData()
    }
}

extension PropertiesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.properties(forType: selectedType).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath) as! PropertiesTableViewCell
        let property = model.properties(forType: selectedType)[indexPath.row]
        cell.priceLabel.text = property.price
        cell.addressLabel.text = property.address
        cell.thumbnailImageView.image = UIImage(named: property.thumbnailName)
    
        return cell
    }
}

extension PropertiesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PropertiesListViewController: AddProertiesDelegate {
    func add(property: Properties) {
        model.add(property: property)
        tableView.reloadData()
    }
}
