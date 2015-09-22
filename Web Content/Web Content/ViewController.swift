//
//  ViewController.swift
//  Web Content
//
//  Created by Lukas Prusha on 2015-09-22.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //creates a url from a string
        let myUrl = NSURL(string: "http://www.stackoverflow.com")
        
        //creates a web session
        let task = NSURLSession.sharedSession().dataTaskWithURL(myUrl!){
            //task returns three variables, data respons and error
            (data,respons,error) in
            
            //check for any error message for conecting to the web
            if error == nil {
                
                //convert the data into readable (in this case html) text
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                println(urlContent)
                
                //doesn't wait for anything but updates right away
                dispatch_async(dispatch_get_main_queue())
                    {
                        //display the webpage on view controller
                        self.webView.loadHTMLString(urlContent! as String, baseURL: nil)
                    }
            }
        }
        //run the declared task
        task.resume()
        //If i put code down here it will run before the above is completed. Dispatch_async to get around that
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

