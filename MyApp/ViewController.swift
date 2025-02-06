import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var attractions: [Attraction] = [
        Attraction(name: "India Gate", description: "Situated in the centre of the country...", imageName: "india_gate"),
        Attraction(name: "Qutub Minar", description: "Situated in the centre of the country...", imageName: "qutub_minar"),
        Attraction(name: "Humayun's Tomb", description: "Situated in the centre of the country...", imageName: "humayuns_tomb")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.itemSize = CGSize(width: collectionView.frame.width - 20, height: 200)
        collectionView.collectionViewLayout = layout

        
        setupSearchTextField()
    }
    
    func setupSearchTextField() {
        // Customize searchTextField if needed
        searchTextField.layer.cornerRadius = 10
        searchTextField.clipsToBounds = true
    }
    
    // MARK: - Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attractions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AttractionCell", for: indexPath) as! AttractionCell
        let attraction = attractions[indexPath.row]
        
        cell.configure(with: attraction)
        
        return cell
    }
}

