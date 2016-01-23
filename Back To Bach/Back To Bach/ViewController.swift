//
//  ViewController.swift
//  Back To Bach
//
//  Created by Lukas Prusha on 2016-01-18.
//  Copyright (c) 2016 LukasGP. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    
    
    @IBAction func play(sender: UIBarButtonItem) {
        
        player.play()
    }
    @IBAction func sliderChanged(sender: AnyObject) {
        
        player.volume = sliderValue.value
    }
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
    }
    @IBAction func stop(sender: UIBarButtonItem) {
        
        player.stop()
        player.currentTime = 0;
    }
    @IBOutlet var sliderValue: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        var audioPath = NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")
        
        var error:NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath!), error: &error)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

