//
//  ViewController.swift
//  SwiftDemo3
//
//  Created by jiaoyu on 2017/12/1.
//  Copyright © 2017年 viewhigh. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let locationLabel = UILabel()
    let locationStrLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationLabel.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 100)
        locationLabel.textAlignment = NSTextAlignment.center
        locationLabel.textColor = UIColor.black
        self.view.addSubview(locationLabel)
        
        locationStrLabel.frame = CGRect(x: 0, y: 200, width: self.view.bounds.width, height: 50)
        locationStrLabel.textColor = UIColor.black
        locationStrLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(locationStrLabel)
        
        let myFoundation = UIButton(type: UIButtonType.custom)
        myFoundation.frame = CGRect(x: 0, y: self.view.bounds.height - 100, width: self.view.bounds.width, height: 80)
        myFoundation.setTitle("我的位置", for: UIControlState.normal)
        myFoundation.setTitleColor(UIColor.red, for: UIControlState.normal)
        myFoundation.addTarget(self, action: #selector(findMyLocation), for: UIControlEvents.touchUpInside)
        self.view.addSubview(myFoundation)
        
        
    }

    @objc
    func findMyLocation()  {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations: NSArray = locations as NSArray
        let currentLocation = locations.lastObject as! CLLocation
        let locationStr = "lat:\(currentLocation.coordinate.latitude)  lng:\(currentLocation.coordinate.longitude)"
        locationLabel.text = locationStr
        locationManager.stopUpdatingLocation()
        
    }
    
    func reverseGeocode(location:CLLocation)  {
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            
            if (error == nil){
                let tempArray = placeMark! as NSArray
                let mark = tempArray.firstObject as! CLPlacemark
                //                now begins the reverse geocode
                let addressDictionary = mark.addressDictionary! as NSDictionary
                let country = addressDictionary.value(forKey: "Country") as! String
                let city = addressDictionary.object(forKey: "City") as! String
                let street = addressDictionary.object(forKey: "Street") as! String
                
                let finalAddress = "\(street),\(city),\(country)"
                self.locationStrLabel.text = finalAddress
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

