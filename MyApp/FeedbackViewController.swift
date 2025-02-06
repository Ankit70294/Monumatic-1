import UIKit

class FeedbackViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var feedbackImageView: UIImageView!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var suggestionTextField: UITextField! // Changed to UITextField
    @IBOutlet weak var rateUsLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    // Star and Label Arrays
    @IBOutlet var starImageViews: [UIImageView]!
    @IBOutlet var ratingLabels: [UILabel]!
    
    // Rating Data Model
    var rating: RatingModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        rating = RatingModel(rating: 0) // Initialize rating model with default rating
    }
    
    func setupUI() {
        // Setup feedback screen UI
        feedbackLabel.text = "Feedback"
        questionLabel.text = "What can we improve in our app?"
        suggestionTextField.placeholder = "Write your suggestions here..."
        rateUsLabel.text = "Rate us!"
        submitButton.setTitle("Submit", for: .normal)
        
        // Style the text field and button
        suggestionTextField.layer.borderWidth = 1
        suggestionTextField.layer.borderColor = UIColor.gray.cgColor
        suggestionTextField.layer.cornerRadius = 8
        submitButton.layer.cornerRadius = 8
        
        // Initialize rating labels
        let ratingTexts = ["Very Bad", "Bad", "Good", "Very Good", "Excellent"]
        for (index, label) in ratingLabels.enumerated() {
            label.text = ratingTexts[index]
        }
        
        // Add gesture recognizers for star rating
        for (index, starImageView) in starImageViews.enumerated() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapStar(_:)))
            tapGesture.view?.tag = index + 1 // Tag stars from 1 to 5
            starImageView.addGestureRecognizer(tapGesture)
            starImageView.isUserInteractionEnabled = true
        }
    }
    
    // Action for Submit Button
    @IBAction func didTapSubmitButton(_ sender: UIButton) {
        guard let suggestion = suggestionTextField.text, !suggestion.isEmpty else {
            print("Please enter a suggestion")
            return
        }
        
        // Use rating model data here
        print("Suggestion: \(suggestion)")
        print("Rating: \(rating?.rating ?? 0)")
        
        // Here you could send the suggestion and rating to your backend or store them locally
    }
    
    // Action for Rating Stars
    @objc func didTapStar(_ gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        rating?.rating = tag
        updateStarImages(for: tag)
    }
    
    // Update star images based on rating
    func updateStarImages(for rating: Int) {
        for (index, starImageView) in starImageViews.enumerated() {
            if index < rating {
                starImageView.image = UIImage(systemName: "star.fill") // Filled star
            } else {
                starImageView.image = UIImage(systemName: "star") // Empty star
            }
        }
    }
}

