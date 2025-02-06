//
//  LogInViewController.swift
//  login View
//
//  Created by admin16 on 16/11/24.
//

import UIKit

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        // Navigate to the Location Screen
        performSegue(withIdentifier: "showLocationScreen", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLocationScreen" {
            // Access the destination view controller
            if let destinationVC = segue.destination as? LocationViewController {
                // Pass data to the destination view controller
                destinationVC.screenTitle = "Location Screen"
            }
        }
    }
}
