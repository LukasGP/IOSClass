//
//  FirstViewController.swift
//  What's The Weather
//
//  Created by Lukas Prusha on 2015-09-22.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

//Global Variables
var location = ""

class FirstViewController: UIViewController, UIWebViewDelegate{

    @IBOutlet var noLocation: UILabel!
    @IBOutlet var webView: UIWebView!
    @IBOutlet var weatherView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.webView.delegate = self
        
        //load the url for the specific location's weather
        //"http://www.weather-forecast.com/"
        let weatherUrl = NSURL(string: location)
        
        println(location)
        //open a task session for that url
        let task = NSURLSession.sharedSession().dataTaskWithURL(weatherUrl!){
            (data,response,error) in
            
            //if the webpage loaded correctly pull the site's content & override the main queue
            //convert to display the site's html rather than pure text
            if(error == nil){
                var weatherContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue()){
                    
                    self.weatherView.loadHTMLString(weatherContent! as String, baseURL: nil)
                }
            }
        }
        task.resume()
        
        if(location != ""){
            noLocation.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        viewDidLoad()
    }

}

