import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: Theme.Metrics.spacing) {
            // Profile picture field at the top center
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Theme.Colors.primary, lineWidth: 4)
                )
                .shadow(radius: 10)
                .padding(.top, Theme.Metrics.margin)
            
            // Data points displayed horizontally
            HStack(spacing: Theme.Metrics.margin) {
                // Badges Discovered
                VStack {
                    Text("Badges Discovered")
                        .font(Theme.Fonts.primary(size: 14))
                        .foregroundColor(Theme.Colors.text)
                    Text("123")  // Replace with dynamic data as needed
                        .font(Theme.Fonts.bold(size: 18))
                        .foregroundColor(Theme.Colors.text)
                }
                
                // Badges Bookmarked
                VStack {
                    Text("Badges Bookmarked")
                        .font(Theme.Fonts.primary(size: 14))
                        .foregroundColor(Theme.Colors.text)
                    Text("45")  // Replace with dynamic data as needed
                        .font(Theme.Fonts.bold(size: 18))
                        .foregroundColor(Theme.Colors.text)
                }
                
                // Popular Badges
                VStack {
                    Text("Popular Badges")
                        .font(Theme.Fonts.primary(size: 14))
                        .foregroundColor(Theme.Colors.text)
                    Text("78")  // Replace with dynamic data as needed
                        .font(Theme.Fonts.bold(size: 18))
                        .foregroundColor(Theme.Colors.text)
                }
            }
            .padding(.horizontal, Theme.Metrics.margin)
            
            // New buttons below the data points
            VStack(spacing: Theme.Metrics.spacing) {
                Button(action: {
                    // Action for Explorally explained
                }) {
                    Text("Explorally explained")
                        .font(Theme.Fonts.primary(size: 16))
                        .foregroundColor(Theme.Colors.text)
                        .padding(Theme.Metrics.padding)
                        .frame(maxWidth: .infinity)
                        .background(Theme.Colors.background)
                        .cornerRadius(Theme.Metrics.cornerRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: Theme.Metrics.cornerRadius)
                                .stroke(Theme.Colors.primary, lineWidth: 1)
                        )
                }
                
                Button(action: {
                    // Action for Settings
                }) {
                    Text("Settings")
                        .font(Theme.Fonts.primary(size: 16))
                        .foregroundColor(Theme.Colors.text)
                        .padding(Theme.Metrics.padding)
                        .frame(maxWidth: .infinity)
                        .background(Theme.Colors.background)
                        .cornerRadius(Theme.Metrics.cornerRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: Theme.Metrics.cornerRadius)
                                .stroke(Theme.Colors.primary, lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, Theme.Metrics.margin)
            
            Spacer()
        }
        .padding(Theme.Metrics.margin)
    }
}
