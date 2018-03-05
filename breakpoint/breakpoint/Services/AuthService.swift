//
//  AuthService.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 4..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation
import Firebase
import ADAL

class AuthService {
    static let instance = AuthService()
    
    // Configurations
    let MS_AUTHORITY_URL = "https://login.microsoftonline.com/common/oauth2/nativeclient" // COMMON OR YOUR TENANT ID
    let MS_CLIENT_ID = "5abe5d72-317c-4620-8f51-68aebc7a973f" // client ID
    let MS_REDIRECT_URI = "breakpoint://bld.juwon.breakpoint" // redirect URI
    
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
    
    // MS login (for Swift 4...)
    func acquireToken(completion: @escaping (_ userInfo: ADUserInformation?, _ accessToken: String?, _ error: NSError?) -> Void) {
        if let _authContext = ADAuthenticationContext(authority: MS_AUTHORITY_URL, error: nil) {
            _authContext.acquireToken(
                withResource: self.MS_CLIENT_ID,
                clientId: MS_CLIENT_ID,
                redirectUri: URL(string: self.MS_REDIRECT_URI),
                promptBehavior: AD_PROMPT_AUTO,
                userId: nil,
                extraQueryParameters: "",
                completionBlock: { (result) in
                    if (result?.status != AD_SUCCEEDED) {
                        completion(nil,
                                   nil,
                                   result?.error)
                    } else {
                        completion(result?.tokenCacheItem.userInformation,
                                   result?.accessToken,
                                   nil)
                    }
                }
            )
        }
    }
}
