//
//  Channel.swift
//  Smack
//
//  Created by 이주원 on 2018. 2. 18..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    // Decodable을 이용하여 JSON에서 자료를 그대로 받아온다. 그래서 밑의 변수들의 이름이 JSON의 Key 이름과 같다.
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?
}
