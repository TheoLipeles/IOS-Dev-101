//
//  ViewController.swift
//  TipCalculatorNYCDA
//
//  Created by Theodore Lipeles on 2/9/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import UIKit

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var taxTextField: UITextField!
    
    @IBOutlet weak var totalTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func calculate(sender: AnyObject) {
        let total = totalTextField.text.doubleValue
        let tax = taxTextField.text.doubleValue / 100
        let tipCalc = TipCalculatorModel(total: total, taxPercent: tax)
        let possibleTips = tipCalc.printPossibleTips()
        
        var result = ""
        
        for (tipPercent, tipValue) in possibleTips {
            result += "\(tipPercent)%: \(tipValue)\n"
        }
        resultLabel.text = result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func displayTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
        taxTextField.resignFirstResponder()
    }


}

