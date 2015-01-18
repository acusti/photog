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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
