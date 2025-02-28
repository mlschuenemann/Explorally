import Foundation

enum BadgeRarity: String, Codable {
    case common
    case uncommon
    case rare
    case epic
    case legendary
}

struct Badge: Identifiable, Codable {
    let id: UUID
    let sightID: UUID
    let collectedAt: Date
    let rarity: BadgeRarity
    
    init(sightID: UUID, collectedAt: Date = Date(), rarity: BadgeRarity = .common) {
        self.id = UUID()
        self.sightID = sightID
        self.collectedAt = collectedAt
        self.rarity = rarity
    }
}
