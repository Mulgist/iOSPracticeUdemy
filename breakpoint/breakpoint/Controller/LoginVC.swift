//
//  LoginVC.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 4..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        
    }
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("Successfully login user.")
                } else {
                    print(String(describing: loginError!.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    // 여기서 문제가 나면 이제는 로그인 문제가 아니라 등록의 문제이기 때문에 loginError를 안쓰고 registrationError가 쓰인다.
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered user.")
                        })
                    } else {
                        print(String(describing: registrationError!.localizedDescription))
                    }
                })
            })
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate {
    
}
