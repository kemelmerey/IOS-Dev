
import UIKit

class ViewController: UIViewController {

    private var movies: [Movie] = [
        Movie(title: "Bird box", year: 2018, genre: "Horror, Sci-Fi, Mystery",  image: UIImage.birdBox, description: "Five years after an ominous unseen presence decimates society, a survivor and her two children make a desperate bid to reach safety.", isFavorite: false),
        Movie(title: "Happy Death Day", year: 2017, genre: "Horror, Comedy, Thriller, Mystery",  image: UIImage.happyDeathDay, description: "A college student must relive the day of her murder over and over again, in a loop that will end only when she discovers her killer's identity.", isFavorite: false),
        Movie(title: "Home Alone", year: 1990, genre: "Comedy, Family",  image: UIImage.homeAlone, description: "An eight-year-old troublemaker, mistakenly left home alone, must defend his home against a pair of burglars on Christmas Eve.", isFavorite: false),
        Movie(title: "Limitless", year: 2011, genre: "Mystery, Thriller",  image: UIImage.limitless, description: "A mysterious pill that enables the user to access 100% of his brain's abilities transforms a struggling writer into a financial wizard, but it also puts him in a new world with many dangers.", isFavorite: false),
        Movie(title: "Midnight", year: 2021, genre: "Thriller",  image: UIImage.midnight, description: "A serial killer ruthlessly hunts down a deaf woman through the streets of South Korea after she witnesses his brutal crime.", isFavorite: false),
        Movie(title: "Spider-man 2", year: 2004, genre: "Action",  image: UIImage.spiderMan2, description: "Peter Parker is beset with troubles in his failing personal life as he battles a former brilliant scientist named Otto Octavius.", isFavorite: false),
        Movie(title: "The call", year: 2020, genre: "Crime, Sci-Fi, Mystery, Thriller",  image: UIImage.theCall, description: "Two people live in different times. Seo-Yeon lives in the present and Young-Sook lives in the past. One phone call connects the two, and their lives are changed irrevocably.", isFavorite: false),
        Movie(title: "Venom", year: 2018, genre: "Action, Sci-Fi, Adventure",  image: UIImage.venomPoster, description: "A failed reporter is bonded to an alien entity, one of many symbiotes who have invaded Earth. But the being takes a liking to Earth and decides to protect it.", isFavorite: false),
    ]

    @IBOutlet private weak var tableView: UITableView!

    private var selectedMovie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? SecondViewController else {
            return
        }
        destVC.configure(with: selectedMovie)
    }
    

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "primaryCell", for: indexPath) as! PrimaryTableViewCell
        let currentModel = movies[indexPath.row]
        cell.configure(currentModel)
        cell.movieGenre.text = currentModel.genre
        cell.movieYear.text = String(currentModel.year)
        cell.favoriteButtonTapped = { [weak self] in
            self?.movies[indexPath.row].isFavorite.toggle()
            self?.tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }

}
struct Movie {
    let title: String
    let year: Int
    let genre: String
    let image: UIImage
    let description: String
    var isFavorite: Bool
}
