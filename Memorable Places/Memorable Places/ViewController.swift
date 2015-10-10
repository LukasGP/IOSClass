//
//  ViewController.swift
//  Memorable Places
//
//  Created by Lukas Prusha on 2015-10-04.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    var manager:CLLocationManager!

    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure map
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        //configure long press colon is used to make sure necessary info is passed on to the action function
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2.0
        
        map.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        //need to make sure it doesn't register multiple long presses when it should be one
        //look for first indication of a long press
        if(gestureRecognizer.state == UIGestureRecognizerState.Began){
            
            var touchPoint = gestureRecognizer.locationInView(self.map)
            var newCoordinate = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
            
            var location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                var title = ""
                
                if(error == nil){
                    if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark){
                        
                        var subThoroughfare:String = ""
                        var thoroughfare:String = ""
                        
                        if(p.subThoroughfare != nil){
                            
                            subThoroughfare = p.subThoroughfare
                            
                        }
                        if(p.thoroughfare != nil){
                            
                            subThoroughfare = p.thoroughfare
                            
                        }
                        
                        title = "\(subThoroughfare) \(thoroughfare)"
                    }
                    
                }
                
                if(title == ""){
                    title = "Added \(NSDate())"
                }
                //add the info to the places array
                places.append(["name":title,"lat":"\(newCoordinate.latitude)","long":"\(newCoordinate.longitude)"])
                
                //declare annotation with the new coordinate point
                var annotation = MKPointAnnotation()
                annotation.coordinate = newCoordinate
                annotation.title = title
                self.map.addAnnotation(annotation)
            })
        }
        
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation:CLLocation = locations[0] as! CLLocation
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        
        
        self.map.setRegion(region, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

