import Foundation
import CoreLocation

struct Sight: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    let geofenceRadius: Double

    // Computed property to easily get a CLLocationCoordinate2D
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
