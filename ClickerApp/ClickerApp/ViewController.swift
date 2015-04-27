//
//  ViewController.swift
//  ClickerApp
//
//  Created by Theodore Lipeles on 2/23/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter:Int!

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func decrementTapped(sender: AnyObject) {
        if (counter > 0) {
            counter = counter - 1
        }
        updateCounterLabel()
    }
    
    @IBAction func incrementTapped(sender: AnyObject) {
        counter = counter + 1
        updateCounterLabel()
    }
    
    @IBAction func resetTapped(sender: AnyObject) {
        counter = 0
        updateCounterLabel()
    }
    
    func updateCounterLabel() {
        counterLabel.text = String(counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTapped(self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

