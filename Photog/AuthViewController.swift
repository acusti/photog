//
//  AuthViewController.swift
//  Photog
//
//  Created by Andrew Patton on 2014-12-07.
//  Copyright (c) 2014 acusti.ca. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    // Other variables scoped to AuthViewController class
    // ...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Define layout to exclude nav bar at top of screen
        self.edgesForExtendedLayout = UIRectEdge.None
        // Title
        //self.navigationItem.title = "Log in"
        
        var emailImageView         = UIImageView(frame: CGRectMake(0, 0, 50, self.textEmail!.frame.size.height))
        emailImageView.image       = UIImage(named: "IconEmail")
        emailImageView.contentMode = .Center
        
        self.textEmail.leftView     = emailImageView
        self.textEmail.leftViewMode = .Always
        
        var passwordImageView         = UIImageView(frame: CGRectMake(0, 0, 50, self.textPassword!.frame.size.height))
        passwordImageView.image       = UIImage(named: "IconPassword")
        passwordImageView.contentMode = .Center
        
        self.textPassword.leftView     = passwordImageView
        self.textPassword.leftViewMode = .Always
    }
    
    override func viewWillAppear(isAnimated: Bool) {
        super.viewWillAppear(isAnimated)
        
        self.navigationController!.setNavigationBarHidden(false, animated: isAnimated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.textEmail.becomeFirstResponder()
    }

    override func viewWillDisappear(isAnimated: Bool) {
        super.viewWillDisappear(isAnimated)
        
        self.navigationController!.setNavigationBarHidden(true, animated: isAnimated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldEditingChanged(sender: UITextField) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Always test email address (user can change from email field to password without triggering this function)
        if self.validateTextEmail() == false
        {
            self.textPassword.resignFirstResponder()
            self.textEmail.becomeFirstResponder()
            return false
        }
        // If this is the email field, continue to password
        if textField == self.textEmail {
            self.textEmail.resignFirstResponder()
            self.textPassword.becomeFirstResponder()
        }
        else if textField == self.textPassword {
            if self.validateTextPassword() == false
            {
                return false
            }
            self.textPassword.resignFirstResponder()
            authenticate()
        }
        return true
    }
    
    // Validation functions
    // --------------------
    func validateTextEmail() -> Bool {
        var email = self.textEmail.text
        if email.isEmpty == true || email.isEmailAddress() == false
        {
            self.presentAlertPopover("Please make sure your email address is entered correctly.", anchor: self.textEmail)
            return false
        }
        return true
    }

    func validateTextPassword() -> Bool {
        var password = self.textPassword.text
        if password.isEmpty {
            self.presentAlertPopover("Please make sure to enter a valid password.", anchor: self.textPassword)
            return false
        }
        return true
    }
    
    func authenticate()
    {
        var email    = self.textEmail.text
        var password = self.textPassword.text
                
        // Otherwise, authenticate
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
