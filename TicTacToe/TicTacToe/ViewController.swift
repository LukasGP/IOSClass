//
//  ViewController.swift
//  TicTacToe
//
//  Created by Lukas Prusha on 2015-09-25.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var a11Text: UIButton!
    @IBOutlet var a12Text: UIButton!
    @IBOutlet var a13Text: UIButton!
    @IBOutlet var a21Text: UIButton!
    @IBOutlet var a22Text: UIButton!
    @IBOutlet var a23Text: UIButton!
    @IBOutlet var a31Text: UIButton!
    @IBOutlet var a32Text: UIButton!
    @IBOutlet var a33Text: UIButton!
    
    
    var boxText = "X"
    @IBAction func a11(sender: AnyObject) {
        boxText = a11Text.titleLabel!.text!
        checkBox()
        a11Text.titleLabel!.text! = boxText
    }
    @IBAction func a12(sender: AnyObject) {
        boxText = a12Text.titleLabel!.text!
        checkBox()
        a12Text.titleLabel!.text! = boxText
    }
    @IBAction func a13(sender: AnyObject) {
        boxText = a13Text.titleLabel!.text!
        checkBox()
        a13Text.titleLabel!.text! = boxText
    }
    @IBAction func a21(sender: AnyObject) {
        boxText = a21Text.titleLabel!.text!
        checkBox()
        a21Text.titleLabel!.text! = boxText
    }
    @IBAction func a22(sender: AnyObject) {
        boxText = a22Text.titleLabel!.text!
        checkBox()
        a22Text.titleLabel!.text! = boxText
    }
    @IBAction func a23(sender: AnyObject) {
        boxText = a23Text.titleLabel!.text!
        checkBox()
        a23Text.titleLabel!.text! = boxText
    }
    @IBAction func a31(sender: AnyObject) {
        boxText = a31Text.titleLabel!.text!
        checkBox()
        a31Text.titleLabel!.text! = boxText
    }
    @IBAction func a32(sender: AnyObject) {
        boxText = a32Text.titleLabel!.text!
        checkBox()
        a32Text.titleLabel!.text! = boxText
    }
    @IBAction func a33(sender: AnyObject) {
        boxText = a33Text.titleLabel!.text!
        checkBox()
        a33Text.titleLabel!.text! = boxText
    }
    
    func checkBox(){
        
        if(boxText == "X"){
            boxText = "O"
        }else{
            boxText = "X"
        }
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

