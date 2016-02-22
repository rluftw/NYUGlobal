//
//  profileViewController.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/20/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profilePicture: UIButton!
    
    @IBAction func changeProfile(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        /*let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profilePicture.layer.masksToBounds = true
        profilePicture.imageView?.contentMode = .ScaleAspectFill
        
        profilePicture.setImage(originalImage, forState: .Normal)
        
        dismissViewControllerAnimated(true, completion: nil)*/
    }
    
}
