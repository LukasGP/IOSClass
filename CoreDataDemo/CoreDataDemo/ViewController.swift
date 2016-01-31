//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Lukas Prusha on 2016-01-23.
//  Copyright (c) 2016 LukasGP. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up the context for us to work within the database
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        //store data in the database and save it
        //newUser.setValue("Dad", forKey: "username")
        //newUser.setValue("pass4", forKey: "password")
        
        context.save(nil)
        
        //retrieve data from database
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        //Request a sepcific item from the database
        request.predicate = NSPredicate(format: "username = %@", "Cait")
        
        //Access the database
        var results = context.executeFetchRequest(request, error: nil)
        if results?.count > 0{
            
            println(results)
            for result: AnyObject in results! {
                
                if let user = result.valueForKey("username") as? String{
                    // Check if user we're looking for. If so, delete their entry & save
                    if user == "Cait" {
                        //context.deleteObject(result as! NSManagedObject)
                        //println(user + " has been deleted")
                        
                        //Update Cait's password after searching for her in the DB
                        result.setValue("Caitrin", forKey: "password")
                    }
                }
                
                context.save(nil)
            }
        } else{
            println("No results")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

