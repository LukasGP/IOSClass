//
//  ViewController.swift
//  TicTacToe
//
//  Created by Lukas Prusha on 2015-09-25.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var currentPlayer: UILabel!
    @IBOutlet var result: UILabel!
    @IBOutlet var a11Text: UIButton!
    @IBOutlet var a12Text: UIButton!
    @IBOutlet var a13Text: UIButton!
    @IBOutlet var a21Text: UIButton!
    @IBOutlet var a22Text: UIButton!
    @IBOutlet var a23Text: UIButton!
    @IBOutlet var a31Text: UIButton!
    @IBOutlet var a32Text: UIButton!
    @IBOutlet var a33Text: UIButton!
    
    var a11Test = ""
    var a12Test = ""
    var a13Test = ""
    var a21Test = ""
    var a22Test = ""
    var a23Test = ""
    var a31Test = ""
    var a32Test = ""
    var a33Test = ""
    
    
    var boxText = ""
    
    var player = 1
    
    @IBAction func a11(sender: AnyObject) {
        boxText = a11Text.titleLabel!.text!
        checkBox()
        a11Text.setTitle(boxText, forState: .Normal)
        a11Test = boxText
        a11Text.enabled = false
        if(checkWinner()){
            disableButtons()
        }
    }
    @IBAction func a12(sender: AnyObject) {
        boxText = a12Text.titleLabel!.text!
        checkBox()
        a12Text.setTitle(boxText, forState: .Normal)
        a12Test = boxText
        a12Text.enabled = false
        if(checkWinner()){
            disableButtons()
        }
    }
    @IBAction func a13(sender: AnyObject) {
        boxText = a13Text.titleLabel!.text!
        checkBox()
        a13Text.setTitle(boxText, forState: .Normal)
        a13Test = boxText
        a13Text.enabled = false
        if(checkWinner()){
            disableButtons()
        }

    }
    @IBAction func a21(sender: AnyObject) {
        boxText = a21Text.titleLabel!.text!
        checkBox()
        a21Text.setTitle(boxText, forState: .Normal)
        a21Test = boxText
        a21Text.enabled = false
        if(checkWinner()){
            disableButtons()
        }
    }
    @IBAction func a22(sender: AnyObject) {
        boxText = a22Text.titleLabel!.text!
        checkBox()
        a22Text.setTitle(boxText, forState: .Normal)
        a22Test = boxText
        a22Text.enabled = false
        if(checkWinner()){
            disableButtons()
        }
    }
    @IBAction func a23(sender: AnyObject) {
        boxText = a23Text.titleLabel!.text!
        checkBox()
        a23Text.setTitle(boxText, forState: .Normal)
        a23Test = boxText
        a23Text.enabled = false
        if(checkWinner()){
            disableButtons()
        }
    }
    @IBAction func a31(sender: AnyObject) {
        boxText = a31Text.titleLabel!.text!
        checkBox()
        a31Text.setTitle(boxText, forState: .Normal)
        a31Test = boxText
        a31Text.enabled = false
        if(checkWinner()){
            disableButtons()
        }
    }
    @IBAction func a32(sender: AnyObject) {
        boxText = a32Text.titleLabel!.text!
        checkBox()
        a32Text.setTitle(boxText, forState: .Normal)
        a32Test = boxText
        a32Text.enabled = false
        if(checkWinner()){
            disableButtons()
        }
    }
    @IBAction func a33(sender: AnyObject) {
        boxText = a33Text.titleLabel!.text!
        checkBox()
        a33Text.setTitle(boxText, forState: .Normal)
        a33Test = boxText
        a33Text.enabled = false
        if(checkWinner()){
            disableButtons()
        }
    }
    
    func checkBox(){
        
        if(player == 1){
            boxText = "X"
            player = 2
        }else{
                boxText = "O"
                player = 1
        }
        updatePlayer()
    }
    
    func updatePlayer(){
        currentPlayer.text = "It's player "+String(player)+"'s turn"
    }
    
    func checkWinner() -> Bool{
        var winner = ""
        if(boxText == "X"){
            winner = "player 1"
        }else{
            winner = "player 2"
        }
        //Check top horizontal
        if(a11Test == boxText && a12Test == boxText && a13Test == boxText){
            result.text = "\(winner)"
            return true
        }
        //Check Middle Horizontal
        if(a21Test == boxText && a22Test == boxText && a23Test == boxText){
            result.text = "\(winner)"
            return true
        }
        //Check Bottom Horizontal
        if(a31Test == boxText && a32Test == boxText && a33Test == boxText){
            result.text = "\(winner)"
            return true
        }
        //Check Left Vertical
        if(a11Test == boxText && a21Test == boxText && a31Test == boxText){
            result.text = "\(winner)"
            return true
        }
        //Check Middle Vertical
        if(a12Test == boxText && a22Test == boxText && a32Test == boxText){
            result.text = "\(winner)"
            return true
        }
        //Check Right Vertical
        if(a13Test == boxText && a23Test == boxText && a33Test == boxText){
            result.text = "\(winner)"
            return true
        }
        //Check Positive Diagonal
        if(a31Test == boxText && a22Test == boxText && a13Test == boxText){
            result.text = "\(winner)"
            return true
        }
        //Check Negative Diagonal
        if(a11Test == boxText && a22Test == boxText && a33Test == boxText){
            result.text = "\(winner)"
            return true
        }
        return false
    }
    
    func disableButtons(){
        
        a11Text.enabled = false
        a12Text.enabled = false
        a13Text.enabled = false
        a21Text.enabled = false
        a22Text.enabled = false
        a23Text.enabled = false
        a31Text.enabled = false
        a32Text.enabled = false
        a33Text.enabled = false
    }
    
    @IBAction func newGame(sender: AnyObject) {
        player = 1
        updatePlayer()
        
        a11Text.enabled = true
        a11Test = ""
        a11Text.setTitle("-", forState: .Normal)
        
        a12Text.enabled = true
        a12Test = ""
        a12Text.setTitle("-", forState: .Normal)
        
        a13Text.enabled = true
        a13Test = ""
        a13Text.setTitle("-", forState: .Normal)
        
        a21Text.enabled = true
        a21Test = ""
        a21Text.setTitle("-", forState: .Normal)
        
        a22Text.enabled = true
        a22Test = ""
        a22Text.setTitle("-", forState: .Normal)
        
        a23Text.enabled = true
        a23Test = ""
        a23Text.setTitle("-", forState: .Normal)
        
        a31Text.enabled = true
        a31Test = ""
        a31Text.setTitle("-", forState: .Normal)
        
        a32Text.enabled = true
        a32Test = ""
        a32Text.setTitle("-", forState: .Normal)
        
        a33Text.enabled = true
        a33Test = ""
        a33Text.setTitle("-", forState: .Normal)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updatePlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

