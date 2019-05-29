//
//  ViewController.swift
//  GroceryList
//
//  Created by EDUARDO MENDOZA on 3/5/19.
//  Copyright © 2019 EDUARDO MENDOZA. All rights reserved.
//

import UIKit
public let defualts = UserDefaults.standard
class TableViewController: UITableViewController {

    var groceryListArray = ["eggs", "butter", "tortilla chips", "salsa", "cheese"]
    
    @IBOutlet weak var enterItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedList = defualts.object(forKey: "groceryList"){
            groceryListArray = savedList as! [String]
            tableView.reloadData()
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let item = enterItemTextField.text
        groceryListArray.append(item!)
        defualts.set(groceryListArray, forKey: "groceryList")
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryListArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = groceryListArray[indexPath.row]
        return cell!
    }
    
    
    
    
    
    
}

