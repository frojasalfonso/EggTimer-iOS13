//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        progressBar.progress = 0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        timer.invalidate()
        progressBar.progress = 0
        label.text = hardness
        
        var currentSeconds = 1
        let totalSeconds = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if currentSeconds <= totalSeconds {
                let progress = Float(currentSeconds) / Float(totalSeconds)
                self.progressBar.setProgress(progress, animated: true)
                print ("\(currentSeconds) seconds")
                currentSeconds += 1
            } else {
                self.timer.invalidate()
                self.label.text = "Done"
                self.playSound()
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    

}
