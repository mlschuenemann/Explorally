import SwiftUI

// A simple model representing a post.
struct Post: Identifiable {
    let id = UUID()
    let username: String
    let siteName: String
    let imageName: String
}

// A view to display a single post.
struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Metrics.spacing) {
            // The text describing what the user did.
            Text("\(post.username) just explored \"\(post.siteName)\"")
                .font(Theme.Fonts.primary(size: 16))
                .foregroundColor(Theme.Colors.text)
            
            // The picture that the person uploaded.
            Image(post.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .cornerRadius(Theme.Metrics.cornerRadius)
        }
        .padding(.vertical, Theme.Metrics.spacing)
    }
}

// The HomeView now includes a header and a scrollable feed of posts.
struct HomeView: View {
    // Sample posts for the feed.
    let posts: [Post] = [
        Post(username: "Tom", siteName: "Eiffel Tower", imageName: "post1"),
        Post(username: "Lucy", siteName: "Golden Gate Bridge", imageName: "post2"),
        // Add additional sample posts as needed.
    ]
    
    var body: some View {
        VStack(spacing: Theme.Metrics.spacing) {
            // Header with title, globe emoji, and subheadline.
            VStack(spacing: 4) {
                HStack(alignment: .center, spacing: 8) {
                    Text("Explorally")
                        .font(Theme.Fonts.bold(size: 24))
                        .foregroundColor(Theme.Colors.text)
                    Text("🌐")
                        .font(Theme.Fonts.bold(size: 24))
                }
                Text("Start Exploring, Start Collecting")
                    .font(Theme.Fonts.primary(size: 16))
                    .foregroundColor(Theme.Colors.secondary)
            }
            .padding(.vertical, Theme.Metrics.margin)
            
            // Feed: A scrollable list of posts.
            ScrollView {
                LazyVStack(alignment: .leading, spacing: Theme.Metrics.spacing) {
                    ForEach(posts) { post in
                        PostView(post: post)
                    }
                }
                .padding(.horizontal, Theme.Metrics.margin)
            }
        }
        .padding(Theme.Metrics.margin)
    }
}
