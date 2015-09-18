//
//  ViewController.swift
//  HowManyFingers
//
//  Created by Lukas Prusha on 2015-09-13.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    @IBOutlet var fingerGuess: UITextField!
    @IBAction func ansSubmission(sender: AnyObject) {
        
        var numberOfFingers = arc4random_uniform(6)
        
        var guessInt = fingerGuess.text.toInt()
        if( guessInt != nil)
        {
            if(guessInt == Int(numberOfFingers))
            {
                result.text = "You are right!"
            }else{
                result.text = "Wrong! It was \(numberOfFingers)"
            }

        }else{
            result.text = "Please enter a number"
        }
               println(fingerGuess.text)
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

