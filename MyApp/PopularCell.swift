import UIKit

class PopularCell: UICollectionViewCell {
    @IBOutlet weak var imageViewPopular: UIImageView!
    @IBOutlet weak var labelMonumentName: UILabel!
    @IBOutlet weak var labelCityName: UILabel!
    
    func configure(with destination: Destination) {
        imageViewPopular.image = UIImage(named: destination.image)
        labelMonumentName.text = destination.name
        labelCityName.text = destination.location
    }
}
