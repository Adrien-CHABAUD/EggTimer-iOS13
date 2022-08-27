//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Store the timings in a dictionnaries to make the code
    // more clean
    let eggTime = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        switch hardness {
        case "Soft":
            print(eggTime[hardness]!)
        case "Medium":
            print(eggTime[hardness]!)
        case "Hard":
            print(eggTime[hardness]!)
        default:
            print("Error")
        }
        
    }
}


