//
//  ViewController.swift
//  weatherApp
//
//  Created by Lukas Prusha on 2015-09-23.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var city: UITextField!
    
    @IBAction func findWeather(sender: AnyObject) {
        
        var userCity = String(city.text)
        userCity = userCity.stringByReplacingOccurrencesOfString(" ", withString: "")
        
        var url = NSURL(string: "http://www.weather-forecast.com/locations/"+userCity+"/forecasts/latest")
        
        if(url != nil){
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                var weather = ""
                var urlContent = "" as NSString
                if(error == nil){
                    
                    urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
                    var urlCheck = String(stringInterpolationSegment: urlContentArray)
                    if(urlContentArray.count > 0 && urlCheck.rangeOfString("You may have mistyped") == nil ){
                            var weatherArray = urlContentArray[1].componentsSeparatedByString("</span>")
                            
                            weather = weatherArray[0] as! String
                            
                            weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                    }else{
                        urlError = true
                    }
                    
                }else{
                    urlError = true
                }
                
                dispatch_async(dispatch_get_main_queue()){
                    
                    if (urlError == true){
                        self.showError()
                    }else{
                        
                        self.resultLabel.text = weather
                    }
                }
            })
            
            task.resume()
        }else{
            showError()
        }

    }
    
    @IBOutlet var resultLabel: UILabel!
    
    func showError(){
        resultLabel.text = "Couldn't find weather for "+city.text + ". Please try again"
        if(city.text != ""){
            city.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.city.delegate = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tap outside of keyboard to close
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    //hit return to close keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

