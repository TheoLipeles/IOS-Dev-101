//
//  MyPickerViewController.swift
//  MyTableApp
//
//  Created by Theodore Lipeles on 3/4/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import UIKit

class MyPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var continents = ["Continent", "Europe", "America", "Asia", "Africa", "Australia"]
    var countries = ["Pick a continent"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        pickerView.delegate = self
//        pickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return continents.count
        } else {
            return countries.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == 0 {
            return continents[row]
        } else {
            return countries[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
        
            switch (row) {
            case 0:
                countries = ["pick a continent"]
                break;
            case 1:
                countries = ["Germany", "Spain", "France"]
                break;
            case 2:
                countries = ["USA", "Canada"]
                break;
            case 3:
                countries = ["China", "India"]
                break;
            case 4:
                countries = ["South Africa", "Nigeria"]
                break;
            case 5:
                countries = ["Australia"]
                break;
            default:
                countries = ["pick a continent"]
                break;
            }
            
            pickerView.reloadComponent(1)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
