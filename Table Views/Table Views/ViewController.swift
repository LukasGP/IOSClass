//
//  ViewController.swift
//  Table Views
//
//  Created by Lukas Prusha on 2015-09-15.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

//UITableViewDelegate makes our UIViewController reponsible for the newly added table
class ViewController: UIViewController,UITableViewDelegate {
    
    var userInfo = ["Lukas", "Caitlin", "Eva","Radka","Paul"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return userInfo.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = userInfo[indexPath.row]
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

