//
//  MapVC.swift
//  pixel-city
//
//  Created by 이주원 on 2018. 2. 23..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
    }
    
    @IBAction func centerMapBtnWasPressed(_ sender: Any) {
        
    }
    
}

extension MapVC: MKMapViewDelegate {
    
}

extension MapVC: CLLocationManagerDelegate {
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
}
