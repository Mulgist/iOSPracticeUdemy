//
//  AuthService.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 4..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        // Auth는 FIRAuth.h에 정의되어 있다.
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            // user에 대한 정보는 FIRUserInfo.h에 정의되어 있다.
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            let userData = ["provider": user.providerID, "email": user.email!]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
}
