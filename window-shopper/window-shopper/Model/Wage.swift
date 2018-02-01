//
//  Wage.swift
//  window-shopper
//
//  Created by 이주원 on 2018. 2. 1..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation
class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
