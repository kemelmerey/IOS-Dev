import UIKit

struct Hero: Decodable {
    let name: String
    let biography: Biography
    let images: HeroImage
    let powerstats: Powerstats
    let appearance: Appearance
    let work: Work

    struct Biography: Decodable {
        let fullName: String
        let publisher: String
        let alignment: String
    }
    
    struct Appearance: Decodable {
        let gender: String
    }
    
    struct Work: Decodable {
        let occupation: String
    }
    
    struct Powerstats: Decodable {
        let intelligence: Int?
        let strength: Int?
        let speed: Int?
    }

    struct HeroImage: Decodable {
        let sm: String
    }
}

class ViewController: UIViewController {
    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroFullName: UILabel!
    @IBOutlet private weak var heroIntelligence: UILabel!
    @IBOutlet private weak var heroStrength: UILabel!
    @IBOutlet private weak var heroSpeed: UILabel!
    @IBOutlet private weak var heroGender: UILabel!
    @IBOutlet private weak var heroOccupation: UILabel!
    @IBOutlet private weak var heroPublisher: UILabel!
    @IBOutlet private weak var heroAlignment: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heroRandomize(_ sender: UIButton){
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }
    
    
    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard self.handleErrorIfNeeded(error: error) == false else {
                return
            }
            
            guard let data else { return }
            self.handleHeroData(data: data)
        }.resume()
    }
    
    private func handleHeroData(data: Data) {
        do {
                let hero = try JSONDecoder().decode(Hero.self, from: data)
                let heroImage = self.getImageFromUrl(string: hero.images.sm)
                
                DispatchQueue.main.async {
                    self.heroName.text = hero.name
                    self.heroFullName.text = hero.biography.fullName
                    self.heroIntelligence.text = hero.powerstats.intelligence.map { String($0) } ?? "N/A"
                    self.heroStrength.text = hero.powerstats.strength.map { String($0) } ?? "N/A"
                    self.heroSpeed.text = hero.powerstats.speed.map { String($0) } ?? "N/A"
                    self.heroGender.text = hero.appearance.gender
                    self.heroOccupation.text = hero.work.occupation
                    self.heroPublisher.text = hero.biography.publisher
                    self.heroAlignment.text = hero.biography.alignment
                    self.heroImage.image = heroImage
                }
        } catch {
            DispatchQueue.main.async {
                self.heroName.text = error.localizedDescription + "\nReRoll again!"
                self.heroFullName.text = ""
                self.heroIntelligence.text = ""
                self.heroStrength.text = ""
                self.heroSpeed.text = ""
                self.heroGender.text = ""
                self.heroOccupation.text = ""
                self.heroPublisher.text = ""
                self.heroAlignment.text = ""
                self.heroImage.image = nil
            }
        }
    }
    
    private func getImageFromUrl(string: String) -> UIImage? {
        guard let heroImageURL = URL(string: string) else { return nil }
        do {
            let imageData = try Data(contentsOf: heroImageURL)
            return UIImage(data: imageData)
        } catch {
            print("Ошибка загрузки изображения: \(error.localizedDescription)")
            return nil
        }
    }
    
    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print(error.localizedDescription)
        return true
    }
}
