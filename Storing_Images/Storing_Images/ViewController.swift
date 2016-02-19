//
//  ViewController.swift
//  Storing_Images
//
//  Created by Lukas Prusha on 2016-02-11.
//  Copyright (c) 2016 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var winterIsComing: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var urlString = "http://teche.ltc.mq.edu.au/wp-content/uploads/2015/03/winter_is_coming_stark_by_bbboz-d68p15j-672x372.jpg"
        
        var url = NSURL(string: urlString)
        var urlRequest = NSURLRequest(URL: url!)
        
        //Need to make sure that we don't attempt to display the image before the image has finished downloading
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response,data,error in
            
            if error != nil {
                println("There was an error")
            }else{
                var image = UIImage(data: data)
                
                // self.winterIsComing.image = image
                
                var documentsDirectory:String?
                
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                  
                    documentsDirectory = paths[0] as? String
                    
                    var savePath = documentsDirectory! + "/winterIsComing.jpg"
                    
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    self.winterIsComing.image = UIImage(named: savePath)
                }
            }
            
        })

        /* Test pulling the image from local storage rather than downloading it:
        var documentsDirectory:String?
        
        var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        if paths.count > 0 {
            
            documentsDirectory = paths[0] as? String
            
            var savePath = documentsDirectory! + "/winterIsComing.jpg"
            
            self.winterIsComing.image = UIImage(named: savePath)
        }*/
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

