//
//   Helpers.swift
//  extensions-dance-party
//
//  Created by 이주원 on 2018. 1. 13..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit

func generateRandomNumbers(quantity: Int) -> [CGFloat] {
    var randomNumberArray = [CGFloat]()
    for _ in 1...quantity {
        let randomNumber = CGFloat(arc4random_uniform(255))
        randomNumberArray.append(randomNumber)
    }
    return randomNumberArray
}
