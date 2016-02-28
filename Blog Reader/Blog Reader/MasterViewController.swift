//
//  MasterViewController.swift
//  Blog Reader
//
//  Created by Lukas Prusha on 2016-02-28.
//  Copyright (c) 2016 LukasGP. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //setup
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        var url = NSURL(string: "https://www.googleapis.com/blogger/v3/blogs/10861780/posts?key=AIzaSyAEck8fjNie71pC8VBL60wXTE2pVXRgiHE")
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            if error != nil{
                    println(error)
            }else{
                //println(NSString(data: data, encoding: NSUTF8StringEncoding))
                
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                
                if jsonResult.count > 0{
                    // Step through each item on the blog and store its title and contents within our database.
                    if var items = jsonResult["items"] as? NSArray{
                        for item in items {
                            //println(item)
                            // If we're on the currently selected title
                            if var title = item["title"] as? String{
                                if var content = item["content"] as? String{
                                    
                                    var newPost: NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("Posts", inManagedObjectContext: context) as! NSManagedObject
                                    newPost.setValue(title, forKey: "title")
                                    newPost.setValue(content, forKey: "content")
                                    
                                    context.save(nil)
                                }
                            }
                        }
                    }
                }
                //**Stoping here** @ 35min into the video
                // Pull our stored data from the database and print it out to check its integrity.
                var request = NSFetchRequest(entityName: "Posts")
                request.returnsObjectsAsFaults = false                
                var results = context.executeFetchRequest(request, error: nil)!
                println(results)
                self.tableView.reloadData()
            }
        })
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "Test"
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}

