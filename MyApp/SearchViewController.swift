import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    // Sample data for locations
    let locations: [Location] = [
        Location(title: "Amer Fort", subtitle: "Rajasthan", iconName: "clock"),
        Location(title: "Gateway of India", subtitle: "Maharashtra", iconName: "clock"),
        Location(title: "Red Fort", subtitle: "Delhi", iconName: "clock"),
        Location(title: "Mysore Palace", subtitle: "Karnataka", iconName: "clock"),
        Location(title: "Charminar", subtitle: "Telangana", iconName: "clock")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        let location = locations[indexPath.row]
        
        cell.textLabel?.text = location.title
        cell.detailTextLabel?.text = location.subtitle
        cell.imageView?.image = UIImage(systemName: location.iconName ?? "clock") // Using system icon as placeholder

        return cell
    }
}

