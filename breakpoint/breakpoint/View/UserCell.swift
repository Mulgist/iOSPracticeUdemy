//
//  UserCell.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 5..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var showing = false
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLbl.text = email
        if isSelected {
            self.checkImage.isHidden = false
        } else {
            self.checkImage.isHidden = true
        }
    }
    
    // iPad에서 checkImage가 반응이 없는 오류가 남 (셀을 직접 클릭하면 변화가 없고 그 밑의 tableView쪽을 클릭하거나 셀을 위아래로 움직이면 변한다. 단순한 버그인건가?)
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if showing == false {
                checkImage.isHidden = false
                showing = true
            } else {
                checkImage.isHidden = true
                showing = false
            }
        }
    }
}
