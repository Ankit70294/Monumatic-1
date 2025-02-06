import UIKit

class TrendingCell: UICollectionViewCell {
    @IBOutlet weak var imageViewTrending: UIImageView!
    @IBOutlet weak var labelCityName: UILabel!
    
    func configure(with destination: Destination) {
        imageViewTrending.image = UIImage(named: destination.image)
        labelCityName.text = destination.name
    }
}
