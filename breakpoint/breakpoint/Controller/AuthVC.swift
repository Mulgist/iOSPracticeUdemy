//
//  AuthVC.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 4..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class AuthVC: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Google SignIn
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func facebookSignInWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func googlePlusSignInWasPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    // MS login (for Swift 4...)
    @IBAction func microsoftSignInWasPressed(_ sender: Any) {
        AuthService.instance.acquireToken { (userInfo, accessToken, error) in
            if let _userInfo = userInfo {
                DispatchQueue.main.sync() {
                    let userLabel = UILabel()
                    userLabel.numberOfLines = 0;
                    userLabel.frame = CGRect(x: 25, y: 125, width: 300, height: 500)
                    userLabel.text = "Welcome \(_userInfo.givenName) \(_userInfo.familyName)"
                    self.view.addSubview(userLabel)
                    
                    print("Access Token: \(accessToken!)")
                }
            }
            if let _error = error {
                print("Error : \(_error.localizedDescription)")
            }
        }
    }
    
}
