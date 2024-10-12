import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DiceImageView1: UIImageView!
    @IBOutlet weak var DiceImageView2: UIImageView!
    
    var diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func RollDice(_ sender: UIButton) {
        rollDice()
    }
    func rollDice() {
            DiceImageView1.image = diceArray[Int.random(in: 0...5)]
            DiceImageView2.image = diceArray[Int.random(in: 0...5)]
        }
    // Detect the shake gesture
        override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if motion == .motionShake {
                rollDice()  // Call the rollDice function when device is shaken
            }
        }
}

