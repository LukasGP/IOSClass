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
        newUser.setValue("Lukas", forKey: "username")
        newUser.setValue("pass", forKey: "password")
        
        context.save(nil)
        
        //retrieve data from database
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        var results = context.executeFetchRequest(request, error: nil)
        
        if results?.count > 0{
            for result: AnyObject in results! {
                println(result)
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

