//
//  ViewController.swift
//  Where Am I
//
//  Created by Lukas Prusha on 2015-10-02.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    
    var manager:CLLocationManager!
    
    @IBOutlet var latitude: UILabel!
    @IBOutlet var longitude: UILabel!
    @IBOutlet var course: UILabel!
    
    @IBOutlet var speed: UILabel!
    @IBOutlet var altitude: UILabel!
    @IBOutlet var address: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation:CLLocation = locations[0] as! CLLocation
        self.latitude.text = "\(userLocation.coordinate.latitude)"
        self.longitude.text = "\(userLocation.coordinate.longitude)"
        
        self.course.text = "\(userLocation.course)"
        self.speed.text = "\(userLocation.speed)"
        self.altitude.text = "\(userLocation.altitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
        
            if(error != nil){
                println(error)
            }else{
                if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark){
                    
                    var subThoroughfare:String = ""
                    if(p.subThoroughfare != nil){
                       subThoroughfare = p.subThoroughfare
                    }
                    
                    self.address.text = "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \n \(p.country)"
                    
                }
            }
        })
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

