//
//  Product.swift
//  coder-swag
//
//  Created by 이주원 on 2018. 2. 5..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation
struct Product {
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var imageName: String
    
    init(title: String, price: String, imageName: String) {
        self.title = title
        self.price = price
        self.imageName = imageName
    }
}
