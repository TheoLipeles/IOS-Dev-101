//
//  MyTableViewController.swift
//  MyTableApp
//
//  Created by Theodore Lipeles on 2/28/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var addressList:[Address] = [Address]()
    
    let contactUrl = MyDocumentDirectory().URLByAppendingPathComponent("contacts")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 2
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return addressList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCustomCell", forIndexPath: indexPath) as MyTableViewCell

        // Configure the cell...
        var addr = addressList[indexPath.row]
        
//        cell.textLabel?.text = addr.name
//        cell.detailTextLabel?.text = addr.city
        
        cell.nameLabel.text = addr.name
        cell.addressLabel.text = addr.address
        cell.cityLabel.text = addr.city
        
        if let path = addr.imageFileName {
            cell.previewImage.image = UIImage(contentsOfFile: fileUrl(path).path!)
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            addressList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            writeFile(addressList, contactUrl)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showAddress" {
            var viewController:MyDetailViewController = segue.destinationViewController as MyDetailViewController
        
            viewController.address = addressList[tableView.indexPathForSelectedRow()!.row]
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if fileExists(contactUrl) {
            println("file exists")
            addressList = readFile(contactUrl) as [Address]
            
        } else {
//            println("file does not exist")
//            var address = ["name":"Aferdita", "address":"hope street", "city": "stamford"]
            var addr1:Address = Address()
            addr1.name = "Theo"
            addr1.address = "340 East 74th St."
            addr1.city = "New York"
            
            addressList = [addr1]
            writeFile(addressList, contactUrl)
        }

    }
    
    
}
