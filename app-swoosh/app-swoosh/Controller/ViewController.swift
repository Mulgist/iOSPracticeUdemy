//
//  ViewController.swift
//  app-swoosh
//
//  Created by 이주원 on 2018. 1. 23..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class WelcomVC: UIViewController {
    @IBOutlet weak var swoosh: UIImageView!
    @IBOutlet weak var bgImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindFromLeagueVC(unwindSegue: UIStoryboardSegue) {
    }

}

