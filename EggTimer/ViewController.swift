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
    
    var secondsPassed:Int = 0
    var totalTime = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        
        timer.invalidate() // Count only once per second

        totalTime = eggTime[hardness]! // Store the time selected by the user
        
        secondsPassed = 0 // Reset second passed
        progressBar.progress = 0.0
        // Reset text
        titleLabel.text = hardness
        
        // Fire every seconds and repeat
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Used to count the passed seconds and invalidate the timer when
    // it is due.
    @objc func updateTimer() -> Void {
        if secondsPassed < totalTime {
            secondsPassed += 1 // Add seconds
            
            // Calculate percentage of completion + show it
            // in the progressBar
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress

        } else {
            // Stop the timer
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
}


