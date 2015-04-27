//
//  ViewController.swift
//  FortuneApp
//
//  Created by Theodore Lipeles on 2/18/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fortunes:[String:[String]]!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBAction func createFortuneTapped(sender: AnyObject) {
        
        var fortune:String!
        
        userNameTextField.resignFirstResponder()
        
        if positiveSwitch.on {
            fortune = fortunes["positive"]!.randomObject
        } else {
            fortune = fortunes["negative"]!.randomObject
        }

        if userNameTextField.text == "" {
            fortuneLabel.text = "You \(fortune)"
        } else {
            fortuneLabel.text = "\(userNameTextField.text), you \(fortune)"
        }
    }
    @IBAction func positiveSwitchSwitched(sender: UISwitch) {
        if sender.on {
            smileyImage.image = UIImage(named: "positive")
        } else {
            smileyImage.image = UIImage(named: "negative")
        }
    }
    @IBAction func displayTapped(sender: AnyObject) {
        userNameTextField.resignFirstResponder()
    }
    
    @IBOutlet weak var smileyImage: UIImageView!
    @IBOutlet weak var fortuneLabel: UILabel!
    @IBOutlet weak var positiveSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var positive: [String]! = ["will live long", "will win the lottery"]
        var negative: [String] = ["will not live long", "will not win the lottery"]
        fortunes = ["positive": positive, "negative": negative]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

