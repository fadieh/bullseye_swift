//
//  ViewController.swift
//  BullsEye
//
//  Created by Fadie on 10/12/2014.
//  Copyright (c) 2014 Fadie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        var title: String
        if difference == 0 {
            title = "PERFECT!"
            points += 100
        } else if difference < 5 {
            title = "SO close!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Good effort"
        } else {
            title = "Not even close"
        }
        
        score += points
        
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert) // local variable
        let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
                                                                            self.startNewRound()
                                                                            self.updateLabels()})
        alert.addAction(action)
        
//        Here, I make the alert visible:
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slide: UISlider) {
        currentValue = lroundf(slide.value)
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
}

