//
//  ViewController.swift
//  EggTimer
//
//  Created by Kemel Merey on 18.10.2024.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var timer = Timer()
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate() // Stop any existing timer
        
        let hardness = sender.currentTitle! // Get the selected hardness
        totalTime = Float(eggTimes[hardness]!) * 60 // Convert minutes to seconds
        secondsPassed = 0
        progressBar.progress = 0.0
        messageLabel.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
                let progress = self.secondsPassed / self.totalTime
                self.progressBar.setProgress(progress, animated: true)
                print("\(self.totalTime - self.secondsPassed) seconds left")
            } else {
                self.timer.invalidate()
                self.messageLabel.text = "DONE"
                self.playSound()
            }
        }
    }
    
    func playSound() {
        if let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}



