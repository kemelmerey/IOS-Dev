
import UIKit

class PrimaryTableViewCell: UITableViewCell {

    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var favoriteButtonTapped: (() -> Void)?

    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        favoriteButtonTapped?()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ model: Movie) {
        titleLabel.text = model.title
        coverImage.image = model.image
        let favoriteImage = model.isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            favoriteButton.setImage(favoriteImage, for: .normal)
    }

}
