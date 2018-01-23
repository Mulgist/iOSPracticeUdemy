//
//  SwitchStatus.swift
//  Eluxon
//
//  Created by 이주원 on 2018. 1. 18..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation

enum SwitchStatus: Togglable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}
