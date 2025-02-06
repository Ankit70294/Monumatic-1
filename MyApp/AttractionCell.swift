import UIKit

class AttractionCell: UICollectionViewCell {
    
    @IBOutlet weak var attractionImageView: UIImageView!
    @IBOutlet weak var shadowOverlay: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(with attraction: Attraction) {
        nameLabel.text = attraction.name
        descriptionLabel.text = attraction.description
        attractionImageView.image = UIImage(named: attraction.imageName)
        
        // Adjust the shadow overlay opacity
        shadowOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.3) // Use a lower alpha value
        shadowOverlay.layer.cornerRadius = 8
        shadowOverlay.clipsToBounds = true
        shadowOverlay.isHidden = false
    }
}
