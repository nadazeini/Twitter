//
//  LoginViewController.swift
//  Twitter
//
//  Created by Nada Zeini on 3/5/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLoginButton(_ sender: UIButton) {
             let myUrl = "https://api.twitter.com/oauth/request_token"
            TwitterAPICaller.client?.login(url: myUrl, success:{ self.performSegue(withIdentifier: "loginToHome", sender: self)
                    }, failure:{Error in print("Fail to login")})
    }
    

}
