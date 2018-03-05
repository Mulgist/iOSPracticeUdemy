//
//  FeedCell.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 5..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}
