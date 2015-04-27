//
//  NewAddressViewController.swift
//  MyTableApp
//
//  Created by Theodore Lipeles on 2/28/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import UIKit

class NewAddressViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    
    @IBOutlet weak var addressImage: UIImageView!
    
    var newAddress = Address()

    var addressList:[Address]!
    
    var pickerController: UIImagePickerController = UIImagePickerController()

    let contactsUrl:NSURL = MyDocumentDirectory().URLByAppendingPathComponent("contacts")
    
    @IBAction func saveTapped(sender: AnyObject) {
        
        if nameTextField.text.isEmpty {
            var alert = UIAlertView(title: "fields required", message: "Please enter a name", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "ok")
            alert.show()
        } else {
            
            addressList = readFile(contactsUrl) as [Address]
            
            // save new address
            // textfields for name, address, and city
            // create a dictionary

            newAddress.name = nameTextField.text
            newAddress.city = cityTextField.text
            newAddress.address = addressTextField.text
            // read the contacts file

//            var imageData:NSData = UIImagePNGRepresentation(addressImage.image)
//            imageData.writeToFile(newAddress.imageFileName!, atomically: true)
            
            // add the dictionary to the contacts
            addressList.append(newAddress)
            
            if let imageFileName = newAddress.imageFileName {
                var imageData:NSData = UIImagePNGRepresentation(addressImage.image)
                
                imageData.writeToFile(fileUrl(imageFileName).path!, atomically: true)
            }
            
            let selectorString  = "imageWasSavedSuccessfully:didFinishSavingWithError:context:"
            
            let selector = Selector(selectorString)
            
            UIImageWriteToSavedPhotosAlbum(addressImage.image, self, selector, nil)
            
            // write the contacts file
            writeFile(addressList, contactsUrl)
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imageWasSavedSuccessfully(image:UIImage, didFinishSavingWithError error: NSError!, context: UnsafeMutablePointer<()>) {
        println("image was saved")
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func resignKeyboard(sender: AnyObject) {
        nameTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
    }
    
    
    @IBAction func addImage(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            pickerController.sourceType = .Camera
        } else {
            pickerController.sourceType = .PhotoLibrary
        }
        
        pickerController.delegate = self
//        pickerController.allowsEditing = true
        
        presentViewController(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
//        let image = info[UIImagePickerControllerEditedImage] as UIImage
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        
        addressImage.image = image
        
        newAddress.imageFileName = "image\(addressList.count + 1).png"
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressList = readFile(contactsUrl) as [Address]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
