//
//  BorderButton.swift
//  app-swoosh
//
//  Created by 이주원 on 2018. 1. 23..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        // 커스텀 UI 설정을 한다.
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }
}
