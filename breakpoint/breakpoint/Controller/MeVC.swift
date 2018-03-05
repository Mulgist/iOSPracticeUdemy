//
//  MeVC.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 4..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tebleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        // 알림 팝업 생성
        let logoutPopup = UIAlertController(title: "로그아웃?", message: "정말로 로그아웃 하시겠습니까?", preferredStyle: .alert)
        let logoutAction = UIAlertAction(title: "응", style: .cancel) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(loginVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        let cancelAction  = UIAlertAction(title: "아니", style: .destructive) { (buttonTapped) in
            logoutPopup.dismiss(animated: true, completion: nil)
        }
        
        logoutPopup.addAction(logoutAction)
        logoutPopup.addAction(cancelAction)
        present(logoutPopup, animated: true, completion: nil)
    }
}
