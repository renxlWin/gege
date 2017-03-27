//
//  RxLocationTool.swift
//  swiftChuge
//
//  Created by RXL on 17/3/27.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit
import CoreLocation  

private let RxLocationInstance = RxLocationTool()

class RxLocationTool: NSObject {
    
    var longitude : Double = 0.0;
    
    var latitude : Double = 0.0;
    
    class var sharedInstance : RxLocationTool {
        
        let tool = RxLocationInstance;
        
        return tool;
    }
    
    lazy var locationManager : CLLocationManager = {
       
        let locationManager = CLLocationManager()
        
        locationManager.delegate = self;
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.distanceFilter = 10;
        
        locationManager.requestAlwaysAuthorization()
        
        return locationManager;
    }()
    
}

extension RxLocationTool {
    
    func startLocation() {
        
        locationManager.startUpdatingLocation();
        
    }
    
    func locationStatu() -> Bool {
        
        let statu = CLLocationManager.authorizationStatus();
        
        if statu == .denied || statu == .restricted {
            
            return false;
        }
        
        return true;
    }
    
    
    func distaceBetween(firstCoordinate : CLLocationCoordinate2D , secondCoordinate : CLLocationCoordinate2D) -> Double {
        
        let current = CLLocation(latitude: firstCoordinate.latitude, longitude: firstCoordinate.longitude)
        
        let before = CLLocation(latitude: secondCoordinate.latitude, longitude: secondCoordinate.longitude)
        
        let distance = current.distance(from: before);
        
        return distance;
    }
}

extension RxLocationTool : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        debugPrint(locations.last ?? "定位失败");
        
        longitude = (locations.last?.coordinate.longitude)!;
        
        latitude = (locations.last?.coordinate.latitude)!;
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        debugPrint(error);
        
    }
}
