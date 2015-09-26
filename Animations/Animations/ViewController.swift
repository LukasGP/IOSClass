//
//  ViewController.swift
//  Animations
//
//  Created by Lukas Prusha on 2015-09-24.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1
    var timer = NSTimer()
    var isAnimating = true
    
    @IBOutlet var alienImage: UIImageView!
    @IBAction func changeFrame(sender: AnyObject) {
    
        if(isAnimating == true){
            
            timer.invalidate()
            
            isAnimating = false
        }else{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("animate"), userInfo: nil, repeats: true)
            
            isAnimating = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("animate"), userInfo: nil, repeats: true)
        
    }
    
    //Stop Motion Animations:
    func animate(){
        
        if(counter == 3){
            counter = 1
        }else{
            counter++
        }
        println(counter)
        alienImage.image = UIImage(named: "frame\(counter).png")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //called just before the view has been displayed
    override func viewDidLayoutSubviews() {
        //move alien off screen so he can be animated back onto screen
        //alienImage.center = CGPointMake(alienImage.center.x - 400, alienImage.center.y)
        
        //make image hidden
        //alienImage.alpha = 0
        
        //create frame & make invisible
        alienImage.frame = CGRectMake(100, 20, 0, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            //animate image in from the right
            //self.alienImage.center = CGPointMake(self.alienImage.center.x + 400, self.alienImage.center.y)
            
            //fade in image
            //self.alienImage.alpha = 1
            
            //zoom image in & change its size
            self.alienImage.frame = CGRectMake(100, 20, 100, 200)

        })
    }
}

