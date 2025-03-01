import SwiftUI

struct BadgeCollectionView: View {
    @ObservedObject var viewModel: BadgeViewModel = BadgeViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.badges) { badge in
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sight ID: \(badge.sightID.uuidString)")
                        .font(.headline)
                    Text("Collected: \(badge.collectedAt, formatter: DateFormatter.shortDateTime)")
                        .font(.subheadline)
                    Text("Rarity: \(badge.rarity.rawValue.capitalized)")
                        .font(.caption)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Collected Badges")
        }
    }
}

// Helper date formatter extension.
extension DateFormatter {
    static var shortDateTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}
