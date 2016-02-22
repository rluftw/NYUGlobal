//
//  SignUpViewController.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/20/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    
    @IBAction func signUp(sender: AnyObject) {
        // Test if the credentials are from NYU
        
        toggleUI()
        
        if usernameTextField.text == "" || passwordTextField.text == ""  {
            let alert = UIAlertController(title: "Sign Up", message: "Please enter an NYU email and password to sign up.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            
            toggleUI()
            
            presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        guard let email = usernameTextField.text where email.hasSuffix("nyu.edu") else {
            let alert = UIAlertController(title: "Sign Up", message: "Please enter an NYU email and password to sign up.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            
            toggleUI()
            
            presentViewController(alert, animated: true, completion: nil)
            
            return
        }

        let ref = (UIApplication.sharedApplication().delegate as! AppDelegate).ref
        
        ref.createUser(email, password: passwordTextField.text,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                    let alert = UIAlertController(title: "Sign Up", message: "Email Taken. Please try another email.", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                    
                    self.toggleUI()
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                    
                    ref.authUser(email, password: self.passwordTextField.text, withCompletionBlock: { error, authData in
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
        })
    }
    
    // MARK: - Helper Methods
    func toggleUI() {
        usernameTextField.enabled = !usernameTextField.enabled
        passwordTextField.enabled = !passwordTextField.enabled
        signUpButton.enabled = !signUpButton.enabled
        
        activityIndicator.isAnimating() ? activityIndicator.stopAnimating(): activityIndicator.startAnimating()
    }
    
}
