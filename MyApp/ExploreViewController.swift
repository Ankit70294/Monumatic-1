import UIKit

class ExploreViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageViewBell: UIImageView!
    @IBOutlet weak var labelGreeting: UILabel!
    @IBOutlet weak var labelExplore: UILabel!
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tabBar: UITabBar!
    
    // MARK: - Data
    var exploreData: ExploreData?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "header")
        
        

        setupCollectionView()
        loadData()
        updateUI()
        
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
    }
    
    private func generateLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .estimated(60))
                
                let itemize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(2.0),
                    heightDimension: .fractionalHeight(6.0)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.45),
                    heightDimension: .absolute(140.0)
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    repeatingSubitem: item,
                    count: 1
                )
                
                let spacing:CGFloat = 20
                group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: spacing, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [sectionHeader]
                sectionHeader.pinToVisibleBounds = true

                
                return section
            default:
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .estimated(60))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
               
                
                let itemize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(3.0),
                heightDimension: .fractionalHeight(8.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.6),
                heightDimension: .absolute(250.0)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                repeatingSubitem: item,
                count: 1
            )
                let spacing:CGFloat = 20
                group.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 10, trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
                section.boundarySupplementaryItems = [sectionHeader]
                sectionHeader.pinToVisibleBounds = true
            return section
            }
            
            
            
        }
        return layout
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func loadData() {
        exploreData = ExploreData(
                    user: User(name: "Rakshit", profilePicture: "profilePic"),
                    trendingDestinations: [
                Destination(image: "delhi", name: "Delhi", location: nil),
                Destination(image: "mumbai", name: "Mumbai", location: nil),
                Destination(image: "bengaluru", name: "Bengaluru", location: nil)
            ],
            popularDestinations: [
                Destination(image: "charminar", name: "Char Minar", location: "Hyderabad"),
                Destination(image: "goldenTemple", name: "Golden Temple", location: "Amritsar"),
                Destination(image: "TajMahal", name: "Taj Mahal", location: "Agra")
            ]
        )
    }
    
    private func updateUI() {
        guard let data = exploreData else { return }
        labelGreeting.text = "Hey \(data.user.name),"
        imageViewProfile.image = UIImage(named: data.user.profilePicture)
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = exploreData else { return 0 }
        return section == 0 ? data.trendingDestinations.count : data.popularDestinations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = exploreData else { return UICollectionViewCell() }
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath) as! TrendingCell
            let destination = data.trendingDestinations[indexPath.item]
            cell.configure(with: destination)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
            let destination = data.popularDestinations[indexPath.item]
            cell.configure(with: destination)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! CollectionViewSectionHeaderView
        return header
//        header.configure(with: indexPath.section == 0 ? "Trending Destinations" : "Popular Destinations")
//        return header
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch exploreData[indexPath.item]
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToNextScreen" {
               let nextVC = segue.destination as! SearchViewController
           }
       }
    
}

