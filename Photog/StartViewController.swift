//
//  StartViewController.swift
//  Photog
//
//  Created by Andrew Patton on 2014-11-30.
//  Copyright (c) 2014 acusti.ca. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapLogIn(sender: UIButton) {
        var viewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func didTapSignUp(sender: UIButton) {
        var viewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
