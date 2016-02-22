//
//  LoginViewController.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/20/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    // MARK: - IBActions
 
    @IBAction func signIn(sender: AnyObject) {
        // Check for an nyu email
        // i.e. @nyu.edu
        
        toggleUI()
        
        if usernameTextField.text == "" || passwordTextField.text == ""  {
            let alert = UIAlertController(title: "Login", message: "Please enter your NYU Credentials.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            
            toggleUI()

            presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        guard let email = usernameTextField.text where email.hasSuffix("nyu.edu") else {
            let alert = UIAlertController(title: "Login", message: "Please enter your NYU Credentials.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            
            toggleUI()

            presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        let ref = (UIApplication.sharedApplication().delegate as! AppDelegate).ref
        ref.authUser(email, password: passwordTextField.text,
            withCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error logging in to this account
                    
                    let alert = UIAlertController(title: "Login", message: "Invalid Credentials. Please Try again.", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                } else {
                    // We are now logged in
                    let tabController = self.storyboard?.instantiateViewControllerWithIdentifier("MainTabBarController") as! UITabBarController
                    self.presentViewController(tabController, animated: true, completion: nil)
                }
                
                self.toggleUI()
        })
        

    }
    
    // MARK: - TextField delegate methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // MARK: - Helper methods
    
    func toggleUI() {
        usernameTextField.enabled = !usernameTextField.enabled
        passwordTextField.enabled = !passwordTextField.enabled
        loginButton.enabled = !loginButton.enabled
        activityIndicator.isAnimating() ? activityIndicator.stopAnimating(): activityIndicator.startAnimating()
    }
}
