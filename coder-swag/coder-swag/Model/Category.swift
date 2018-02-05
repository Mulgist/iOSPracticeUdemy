//
//  Category.swift
//  coder-swag
//
//  Created by 이주원 on 2018. 2. 2..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String!
    private(set) public var imageName: String!
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
