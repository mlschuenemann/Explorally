import Foundation
import CoreLocation

// Define a custom notification name for geofence entry events.
extension Notification.Name {
    static let geofenceEntered = Notification.Name("geofenceEntered")
}

class BadgeCollectionService {
    static let shared = BadgeCollectionService()

    private init() {
        // Subscribe to geofence entry notifications.
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleGeofenceEntry(_:)),
                                               name: .geofenceEntered,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // This method is called whenever a geofence is entered.
    @objc private func handleGeofenceEntry(_ notification: Notification) {
        guard let region = notification.object as? CLRegion else {
            return
        }
        // We assume the region identifier is the UUID string of the corresponding sight.
        guard let sightID = UUID(uuidString: region.identifier) else {
            return
        }
        collectBadge(for: sightID)
    }
    
    // Core logic to "collect" a badge for a given sight.
   private func collectBadge(for sightID: UUID) {
    let newBadge = Badge(sightID: sightID, collectedAt: Date(), rarity: determineBadgeRarity(for: sightID))
    // Optionally save the badge to your database here.
    print("Badge collected for sight \(sightID): \(newBadge)")
    // Notify subscribers that a badge has been collected.
    NotificationCenter.default.post(name: .badgeCollected, object: newBadge)
}

    
    // Example function to determine badge rarity. This could be based on more advanced logic.
    private func determineBadgeRarity(for sightID: UUID) -> BadgeRarity {
        let rarities: [BadgeRarity] = [.common, .uncommon, .rare, .epic, .legendary]
        return rarities.randomElement() ?? .common
    }
}
