//
//  ToDoListViewController.swift
//  CoreDataExample02
//
//  Created by Shreesha on 23/11/21.
//

import UIKit

class ToDoListViewController: UITableViewController {
     
    var itemArray = [Item]()
    
    let userDefaults  = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
       if let items = userDefaults.array(forKey: "toDoItem") as? [Item] {   
          itemArray = items
        }
        
        var newItem = Item()
        newItem.title = "Buy Eggs"
        itemArray.append(newItem)
       
    }

   // MARK: - Table view data source

    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoTableViewCell
        cell.toDoLabel.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        }
        else
        {
            itemArray[indexPath.row].done = false
        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    //MARK: - ADD Button
    
    
    @IBAction func addItemButton(_ sender: UIBarButtonItem) {
        var itemText = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action  = UIAlertAction(title: "Add", style: .default) {
            (action) in
            
            var newItem = Item()
            newItem.title = itemText.text!
           self.itemArray.append(newItem)
          self.userDefaults.set(self.itemArray, forKey: "toDoItem")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Item"
            itemText = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    

   
}
