//
//  FirstViewController.swift
//  To Do List
//
//  Created by Lukas Prusha on 2015-09-19.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

//Global Variables
var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate{
    

    @IBOutlet var toDoListTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    //updates the table every time the view is shown rather than just on initial launch
    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
    }
}

