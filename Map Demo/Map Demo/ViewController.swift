//
//  ViewController.swift
//  Map Demo
//
//  Created by Lukas Prusha on 2015-09-30.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Configure the necessary information for displaying an area on the map
        var latitude:CLLocationDegrees = 48.440539
        var longitude:CLLocationDegrees = -123.351649
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta,lonDelta)
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location,span)
        map.setRegion(region, animated: true)
        
        //creates a pin with a title on a specific location 'location'
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Home is where the heart is"
        annotation.subtitle = "let's get down to business"
        map.addAnnotation(annotation)
        
        //recognize a long press of minimum duration 2 seconds and runs 'action'
        //the colon is to send the gesture recognizer when action is called
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        //Log the point where the touch was recognized & create a coordinate from that location
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        //creates a pin with a title on a specific location 'location'
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New Location"
        annotation.subtitle = "Where we at"
        map.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

