//
//  AuthVC.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 4..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func facebookSignInWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func googlePlusSignInWasPressed(_ sender: Any) {
        
    }
}
