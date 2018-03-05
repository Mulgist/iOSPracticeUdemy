//
//  Message.swift
//  breakpoint
//
//  Created by 이주원 on 2018. 3. 5..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation

class Message {
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
