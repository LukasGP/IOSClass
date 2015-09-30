//
//  ViewController.swift
//  TutorialTicTacToe
//
//  Created by Lukas Prusha on 2015-09-29.
//  Copyright (c) 2015 LukasGP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //1 = "O"
    //2 = "X"
    var activePlayer = 1
    
    var gameActive = true
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombinations = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    
    @IBOutlet var playAgainButton: UIButton!
    @IBOutlet var gameOverLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    @IBAction func playAgain(sender: AnyObject) {
        
         activePlayer = 1
         gameActive = true
         gameState = [0,0,0,0,0,0,0,0,0]
        
        var button = UIButton()
        for(var i = 0; i < 9; i++){
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        println(gameState[sender.tag])
        println(gameActive)
        if(gameState[sender.tag] == 0 && gameActive == true)
        {
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if(activePlayer == 1){
                image = UIImage(named: "nought.png")!
                
                activePlayer = 2
            }else{
                image = UIImage(named: "cross.png")!
                activePlayer = 1
            }
            
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations{
                
                if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]){
                    
                    var labelText = "O's have won!"
                    
                    if(gameState[combination[0]] == 2){
                        
                        labelText = "X's have won!"
                    }
                    
                    gameOverLabel.text = labelText
                    
                    gameOverLabel.hidden = false
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                        
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
                    })
                    
                    gameActive = false
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {

    }


}

