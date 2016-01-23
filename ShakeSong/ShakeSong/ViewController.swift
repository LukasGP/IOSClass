//
//  ViewController.swift
//  ShakeSong
//
//  Created by Lukas Prusha on 2016-01-23.
//  Copyright (c) 2016 LukasGP. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    var songs = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        if event.subtype == UIEventSubtype.MotionShake {
            
            var randomNumber = Int(arc4random_uniform(UInt32(songs.count)))
            
            var fileLocation = NSBundle.mainBundle().pathForResource(songs[randomNumber], ofType: "mp3")
            
            var error: NSError? = nil
            
            player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!), error: &error)
            
            player.play()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

