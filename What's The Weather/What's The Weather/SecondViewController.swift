//
//  SecondViewController.swift
//  What's The Weather
//
//  Created by Lukas Prusha on 2015-09-22.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var locationField: UITextField!
    @IBAction func submitLocation(sender: AnyObject) {
        
        location = "http://www.weather-forecast.com/locations/" + locationField.text + "/forecasts/latest"
        //**testing location url
        println(location)
        locationField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationField.delegate = self
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

