//
//  ChannelVC.swift
//  Smack
//
//  Created by 이주원 on 2018. 2. 6..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

extension UIDevice {
    public var isiPhone: Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            return true
        }
        return false
    }
    public var isiPad: Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            return true
        }
        return false
    }
}

class ChannelVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 슬라이드 메뉴 화면 너비
        if UIDevice.current.isiPhone {
            self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        }
        if UIDevice.current.isiPad {
            self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 120
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
}
