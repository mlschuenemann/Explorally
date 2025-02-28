import Foundation
import Combine

class BadgeViewModel: ObservableObject {
    // Published array that holds all collected badges.
    @Published var badges: [Badge] = []
    
    private var badgeCollectionObserver: AnyCancellable?
    
    init() {
        // Subscribe to the badgeCollected notification.
        badgeCollectionObserver = NotificationCenter.default
            .publisher(for: .badgeCollected)
            .compactMap { $0.object as? Badge }
            .sink { [weak self] badge in
                self?.badges.append(badge)
                print("BadgeViewModel: New badge collected - \(badge)")
            }
    }
    
    deinit {
        badgeCollectionObserver?.cancel()
    }
}
