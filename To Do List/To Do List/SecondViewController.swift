//
//  SecondViewController.swift
//  To Do List
//
//  Created by Lukas Prusha on 2015-09-19.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        //add item to toDoList array
        toDoList.append(item.text)
        item.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.item.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //tap outside of keyboard to close
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    
        self.view.endEditing(true)
    }
    //closes keyboard when return is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

