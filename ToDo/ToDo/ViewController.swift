//
//  ViewController.swift
//  ToDo
//
//  Created by Theodore Lipeles on 2/25/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var readTitleTextField: UITextField!
    @IBOutlet weak var readText: UILabel!
    
    @IBAction func saveFile(sender: AnyObject) {
        
        let destinationPath = NSTemporaryDirectory() + self.titleTextField.text + ".txt"
        
        println("\(destinationPath)")
        
        let documentPath = MyDocumentDirectory().URLByAppendingPathComponent(self.titleTextField.text + ".txt")
        
        println("\(documentPath)")
        
        var error:NSError?
        
        let written = descriptionTextField.text.writeToURL(documentPath, atomically: true, encoding: NSUTF8StringEncoding, error: &error)
        
        if written {
            println("\(NSString(contentsOfURL: documentPath, encoding: NSUTF8StringEncoding, error: nil) as String)")
        }
        
    }
    
    @IBAction func readFile(sender: AnyObject) {
        
        let documentPath = MyDocumentDirectory().URLByAppendingPathComponent(self.readTitleTextField.text + ".txt")
        
        readText.text = NSString(contentsOfURL: documentPath, encoding: NSUTF8StringEncoding, error: nil) as String?
    }
    
    @IBAction func resignKeyboard(sender: AnyObject) {
        titleTextField.resignFirstResponder()
        descriptionTextField.resignFirstResponder()
        readTitleTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

