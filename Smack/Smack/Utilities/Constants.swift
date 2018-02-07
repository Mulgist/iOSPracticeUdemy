//
//  Constants.swift
//  Smack
//
//  Created by 이주원 on 2018. 2. 6..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation

// 클로저
typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
// MongoDB 사용
let BASE_URL = "https://smackdbjuwon.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

// Segue
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
