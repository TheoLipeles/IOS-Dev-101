//
//  BooksTableViewController.swift
//  BookStore
//
//  Created by Theodore Lipeles on 3/9/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import UIKit
import CoreData

class BooksTableViewController: UITableViewController {
    
    var books = [Book]()
    
        let managedContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    
    func saveBook(bookTitle:String) {
        
//        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        
        let entity = NSEntityDescription.entityForName("Book", inManagedObjectContext: managedContext)
        let book = Book(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        book.setValue(bookTitle, forKey: "bookTitle")
        
        var error:NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.description)")
        }
        
        books.append(book)
    }
    
    @IBAction func addBook(sender: AnyObject) {

        var alert = UIAlertController(title: "New Book", message: "Add a new Book", preferredStyle:UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) {
            (action: UIAlertAction!) -> Void in
            
            let textField = alert.textFields![0] as UITextField
            
            // add to an array of books
            
//            self.books.append(textField.text)
            self.saveBook(textField.text)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!

        let fetchRequest = NSFetchRequest(entityName: "Book")
        
        var error:NSError?
        let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [Book]?
        
        if let results = fetchResults {
            books = results
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return books.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        
        let book:Book = books[indexPath.row]
        
        cell.textLabel?.text = book.bookTitle

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
            
            managedContext.deleteObject(books[indexPath.row])
            
            var error:NSError?
            if !managedContext.save(&error) {
                println("Could not save \(error), \(error?.description)")
            }
            
            books.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
