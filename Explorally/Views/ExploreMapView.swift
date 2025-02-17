import SwiftUI
import MapKit

struct ExploreMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 180, longitudeDelta: 360)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all)
            .ignoresSafeArea()
            .overlay(alignment: .top) {
                ZStack {
                    // Slim white horizontal background
                    Color.white
                        .frame(height: 50)
                    
                    // HStack with three equally spaced circles
                    HStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 30, height: 30)
                        Spacer()
                        Circle()
                            .fill(Color.green)
                            .frame(width: 30, height: 30)
                        Spacer()
                        Circle()
                            .fill(Color.yellow)  // Using yellow as a stand-in for gold
                            .frame(width: 30, height: 30)
                    }
                    .padding(.horizontal, 20)
                }
            }
    }
}
