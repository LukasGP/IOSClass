//
//  ViewController.swift
//  Webview Demo
//
//  Created by Lukas Prusha on 2016-02-22.
//  Copyright (c) 2016 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        var url = NSURL(string: "http://google.com")
        
        var requestUrl = NSURLRequest(URL:url!)
        
        webView.loadRequest(requestUrl)
        */
        
        var html = "<html> <head> </head> <h1> Hello World! </h1> </body> </html>"
        webView.loadHTMLString(html, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

