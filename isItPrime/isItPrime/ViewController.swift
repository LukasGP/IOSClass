//
//  ViewController.swift
//  isItPrime
//
//  Created by Lukas Prusha on 2015-09-14.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputNum: UITextField!
    @IBOutlet var result: UILabel!
    @IBOutlet var checkNum: UILabel!
    @IBAction func checkNum(sender: AnyObject) {
        
        var count = 1
        var isItPrime = 0
        var intInputNum = inputNum.text.toInt()!
        if(inputNum == nil)
        {
            result.text = "Please input a valid number"
        }
        while(count<inputNum.text.toInt())
        {
            if(intInputNum%count == 0)
            {
                isItPrime++
            }
            count++
        }
        if(isItPrime == 1 && intInputNum > 1)
        {
            result.text = "\(intInputNum) is a prime number"
        }else {
            result.text = "\(intInputNum) isn't a prime number"
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

