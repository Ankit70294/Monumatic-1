import UIKit

struct ExploreData {
    let user: User
    let trendingDestinations: [Destination]
    let popularDestinations: [Destination]
}

struct User {
    let name: String
    let profilePicture: String
}

struct Destination {
    let image: String
    let name: String
    let location: String?
}

struct Attraction {
    let name: String
    let description: String
    let imageName: String
}

struct AccountOption {
    let title: String
    let iconName: String?
}


struct PreferencesModel {
    let title: String
    let detail: String
    let showDisclosure: Bool
}


struct NotificationSettings {
    var isPushNotificationsEnabled: Bool
    var isEmailNotificationsEnabled: Bool
}


struct RatingModel {
    var rating: Int
}


struct ProfileItem {
    let icon: String
    let title: String
    let value: String
}

struct Location {
    let title: String      // Name of the monument or place
    let subtitle: String   // State or location description
    let iconName: String?  // Optional icon name, if needed
}
