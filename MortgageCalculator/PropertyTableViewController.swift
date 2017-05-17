//
//  PropertyTableViewController.swift
//  MortgageCalculator
//
//  Created by Ekta Sorathia on 5/8/17.
//  Copyright © 2017 Gaurav Chodwadia. All rights reserved.
//

import UIKit
import os.log

class PropertyTableViewController: UITableViewController {

    var properties = [Property]()
    var property: Property!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedProperty = loadProperties() {
            properties += savedProperty
        }else{
            print("No Properties added.")
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return properties.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PropertyTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier   , for: indexPath) as? PropertyTableViewCell else{
            fatalError("The dequeued cell is not an instance of PropertyTableViewCell.")
        }
        
        let propertyCell = properties[indexPath.row]
        cell.AddressLabel.text = propertyCell.address1
        cell.DownPmtValLabel.text = String(propertyCell.downPymt)
        cell.DownPmtLabel.text = "Down Payment:"
        cell.MonthlyPmtLabel.text = "Monthly Payment:"
        cell.MonthlyPmtValLabel.text = String(propertyCell.monthlyPmt)
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
     //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            properties.remove(at: indexPath.row)
           
            tableView.deleteRows(at: [indexPath], with: .fade)
             saveProperty()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToPropertyList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? PropertyViewController, let property = sourceViewController.property {
                print(property)
                //properties.append(property)
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                properties[selectedIndexPath.row] = property
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new meal.
                let newIndexPath = IndexPath(row: properties.count, section: 0)
                
                properties.append(property)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
             saveProperty()
        }
    }
    

    func loadProperties() ->[Property]? {
        print(PropertyDAO.ArchiveURL.path)
        
        var store = NSKeyedUnarchiver.unarchiveObject(withFile: PropertyDAO.ArchiveURL.path) as? [Property]!
        return store!
    }
    
    private func saveProperty() {
        //var dao = PropertyDAO(property.getPropertyPrice(),property.getAPR(),property.getTerm(), property.getDownPmt(),property.getMonthlyPmt(),property.getAddress(), property.getCity(),property.getState(), property.getZip(), property.getLatitude(),property.getLongitude())
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(properties, toFile: Property.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("Meals successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
}
