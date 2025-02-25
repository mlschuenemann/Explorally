import SwiftUI

// Here is another test change

struct MainContainerView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        VStack(spacing: 0) {
            // Main content area: switch view based on selected tab
            contentForTab
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Divider()
            
            // Persistent menu bar
            MenuBar(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    @ViewBuilder
    private var contentForTab: some View {
        switch selectedTab {
        case .home:
            HomeView()
        case .explore:
            ExploreMapView()
        case .profile:
            ProfileView()
        }
    }
}

struct MainContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MainContainerView()
    }
}
