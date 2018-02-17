//
//  ChatVC.swift
//  Smack
//
//  Created by 이주원 on 2018. 2. 6..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    // Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        // Slide-out 메뉴의 제스처 추가
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        // 앱 실행시 isLogged는 유지되고 나머지는 초기화된다. 그래서 isLogged가 true시 channelVC로 Notification을 post한다.
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }

}
