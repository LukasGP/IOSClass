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
    
    @IBOutlet var alienImage: UIImageView!
    @IBAction func changeFrame(sender: AnyObject) {

        if(counter == 5){
            counter = 1
        }else{
            counter++
        }
        alienImage.image = UIImage(named: "frame\(counter).png")
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

