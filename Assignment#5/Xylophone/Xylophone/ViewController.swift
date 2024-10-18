import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
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
