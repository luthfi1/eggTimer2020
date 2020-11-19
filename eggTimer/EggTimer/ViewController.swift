//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 5,"Medium": 7,"Hard":12]
    
    
    var totalTime = 0
    var secondPassed = 0
    
    
    var timer = Timer()
    
    
    @IBAction func eggButton(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime =  eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        eggLabel.text = hardness
        
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimes), userInfo: nil, repeats: true)
    }
    @objc func updateTimes(){
        if secondPassed < totalTime{
            
            secondPassed += 1
            
            progressBar.progress = Float(secondPassed) / Float(totalTime)
        }else{
            timer.invalidate()
            eggLabel.text = "Done(Selesai)"
        }
    }
}
