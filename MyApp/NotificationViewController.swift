//
//  NotificationViewController.swift
//  login View
//
//  Created by admin16 on 16/11/24.
//

import UIKit

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func allowNotificationsTapped(_ sender: UIButton) {
            // Show Notification Alert
            let alert = UIAlertController(title: "'Monumattic' would like to send you notifications", message: "Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Don’t Allow", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Allow", style: .default, handler: { _ in
                // Proceed to the main app screen or another screen if needed
                // For now, we'll just print a message
                print("Notifications Enabled")
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
