//
//  ViewController.swift
//  Cat Years
//
//  Created by Lukas Prusha on 2015-09-10.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var age: UITextField!
    @IBOutlet var result: UILabel!
    @IBOutlet var myLabel1: UILabel!

    @IBAction func catAge(sender: AnyObject) {
        
        var enteredAge = age.text.toInt()
        
        if(enteredAge != nil)
        {
            var catYears = enteredAge! * 7
            result.text = "Your cat is \(catYears) in cat years"
        }
        else{
            result.text = "Woops! You didn't enter anything!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

