//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Store the timings in a dictionnaries to make the code
    // more clean
    let eggTime = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    // Create a timer object
    var timer:Timer = Timer()
    
    var secondsRemaining:Int = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 1
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        
        timer.invalidate() // Count only once per second
        
        switch hardness {
        case "Soft":
            print(eggTime[hardness]!)
            secondsRemaining = eggTime[hardness]!
        case "Medium":
            print(eggTime[hardness]!)
            secondsRemaining = eggTime[hardness]!
        case "Hard":
            print(eggTime[hardness]!)
            secondsRemaining = eggTime[hardness]!
        default:
            print("Error")
        }
        
        // Fire every seconds and repeat
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Used to count the passed seconds and invalidate the timer when
    // it is due.
    @objc func updateTimer() -> Void {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
}


