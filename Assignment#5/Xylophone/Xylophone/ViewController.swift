import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        // Animate button press to reduce opacity
        UIView.animate(withDuration: 0.1) {
            sender.alpha = 0.5
        }
        
        // Restore button opacity after 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
            }
        }
        
        // Play sound
        guard
            let title = sender.title(for: .normal),
            let urlForSound = Bundle.main.url(forResource: title, withExtension: "wav")
        else {
            return
        }
        
        player = AVPlayer(url: urlForSound)
        player?.play()
    }
}

