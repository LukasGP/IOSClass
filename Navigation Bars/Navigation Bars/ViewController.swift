//
//  ViewController.swift
//  Navigation Bars
//
//  Created by Lukas Prusha on 2015-09-14.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer()
    var count = 0
    
    @IBOutlet var labelTime: UILabel!
    
    @IBAction func timerStart(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("time"), userInfo: nil, repeats: true)
    }
    @IBAction func timerStop(sender: AnyObject) {
                timer.invalidate()
                count = 0
                labelTime.text = "\(count)"

    }
    @IBAction func timerPause(sender: AnyObject) {
        timer.invalidate()
        labelTime.text = "\(count)"
    }
    @IBAction func timerReset(sender: AnyObject) {
        count = 0
        labelTime.text = "\(count)"
    }
    func time()
    {
        count++
        labelTime.text = "\(count)"
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

