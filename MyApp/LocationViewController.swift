//
//  LocationViewController.swift
//  login View
//
//  Created by admin16 on 16/11/24.
//

import UIKit

class LocationViewController: UIViewController {
    var screenTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let title = screenTitle {
                    self.title = title
                }
    }
    @IBAction func allowLocationTapped(_ sender: UIButton) {
            // Show Location Alert
            let alert = UIAlertController(title: "Allow 'Monumattic' to access your location while using the app?", message: "We need access to your location", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Don’t Allow", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Allow", style: .default, handler: { _ in
                // Navigate to the Notification Screen after Allowing
                self.performSegue(withIdentifier: "showNotificationScreen", sender: nil)
            }))
            
            present(alert, animated: true, completion: nil)
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
