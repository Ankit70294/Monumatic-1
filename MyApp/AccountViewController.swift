import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editProfileButton: UIButton!
    
    // Profile Data Model
    var profileData: [ProfileItem] = [
        ProfileItem(icon: "person.fill", title: "Name:", value: "John Doe"),
        ProfileItem(icon: "calendar", title: "Birthdate:", value: "01/01/1990"),
        ProfileItem(icon: "phone.fill", title: "Mobile No.:", value: "+1234567890"),
        ProfileItem(icon: "envelope.fill", title: "Email ID:", value: "johndoe@example.com"),
        ProfileItem(icon: "lock.fill", title: "Password:", value: "••••••••")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Register UITableViewCell
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProfileCell")
    }
    
    func setupUI() {
        profileLabel.text = "Profile"
        editProfileButton.setTitle("Edit Profile", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5  // Number of rows for profile information
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)

        cell.textLabel?.text = ["Name:     Naman Pandey ", "Birthdate:     23/11/2004 ", "Mobile No.:     7014837213", "Email ID:     namanpandey@gmail.com", "Password:     ••••••••"][indexPath.row]
        cell.imageView?.image = UIImage(named: ["name_icon", "birthdate_icon", "mobile_icon", "email_icon", "password_icon"][indexPath.row])
        
        return cell
    }

    // MARK: - Edit Profile Action
    
    @IBAction func didTapEditProfile(_ sender: UIButton) {
        print("Edit Profile button tapped")
        // Implement edit profile functionality here
    }
}

