
import UIKit

struct Movie {
    let title: String
    let year: Int
    let genre: String
    let image: UIImage
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let movies = [
        Movie(title: "Bird box", year: 2018, genre: "Horror, Sci-Fi, Mystery",  image: UIImage.birdBox),
        Movie(title: "Happy Death Day", year: 2017, genre: "Horror, Comedy, Thriller, Mystery",  image: UIImage.happyDeathDay),
        Movie(title: "Home Alone", year: 1990, genre: "Comedy, Family",  image: UIImage.homeAlone),
        Movie(title: "Limitless", year: 2011, genre: "Mystery, Thriller",  image: UIImage.limitless),
        Movie(title: "Midnight", year: 2021, genre: "Thriller",  image: UIImage.midnight),
        Movie(title: "Spider-man 2", year: 2004, genre: "Action",  image: UIImage.spiderMan2),
        Movie(title: "The call", year: 2020, genre: "Crime, Sci-Fi, Mystery, Thriller",  image: UIImage.theCall),
        Movie(title: "Venom", year: 2018, genre: "Action, Sci-Fi, Adventure",  image: UIImage.venomPoster),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let movie = movies[indexPath.row]
        
        cell.movieTitle.text = movie.title
        cell.movieImage.image = movie.image
        cell.movieGenre.text = movie.genre
        cell.movieYear.text = String(movie.year)
        
        return cell
    }
}

