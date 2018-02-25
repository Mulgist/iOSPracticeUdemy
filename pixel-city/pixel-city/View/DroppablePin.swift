//
//  DroppablePin.swift
//  pixel-city
//
//  Created by 이주원 on 2018. 2. 25..
//  Copyright © 2018년 이주원. All rights reserved.
//

import Foundation
import MapKit

class DroppablePin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var identifier: String
    
    init(coordinate: CLLocationCoordinate2D, identifier: String) {
        self.coordinate = coordinate
        self.identifier = identifier
        super.init()
    }
}
