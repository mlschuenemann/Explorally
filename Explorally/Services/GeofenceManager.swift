import CoreLocation
import Foundation

class GeofenceManager: NSObject, CLLocationManagerDelegate {
    static let shared = GeofenceManager()
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        // Request best accuracy; adjust if needed
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Enable background location updates if your app requires it
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
    }
    
    // Call this method to request location permissions from the user
    func requestPermissions() {
        locationManager.requestAlwaysAuthorization()
    }
    
    // Adds a geofence for a given Sight.
    func addGeofence(for sight: Sight) {
        let center = sight.coordinate
        let region = CLCircularRegion(center: center, radius: sight.geofenceRadius, identifier: sight.id.uuidString)
        region.notifyOnEntry = true
        // Set to false if you only want to trigger on entry.
        region.notifyOnExit = false
        locationManager.startMonitoring(for: region)
        print("Started monitoring geofence for sight: \(sight.name)")
    }
    
    // Removes a geofence for a given Sight.
    func removeGeofence(for sight: Sight) {
        let identifier = sight.id.uuidString
        for region in locationManager.monitoredRegions {
            if let circularRegion = region as? CLCircularRegion, circularRegion.identifier == identifier {
                locationManager.stopMonitoring(for: circularRegion)
                print("Stopped monitoring geofence for sight: \(sight.name)")
            }
        }
    }
    
    // MARK: - CLLocationManagerDelegate Methods
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("User entered geofence region: \(region.identifier)")
        // Here you might update your view model or trigger a badge collection event.
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("User exited geofence region: \(region.identifier)")
        // You can handle exit events if needed.
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("Monitoring failed for region: \(region?.identifier ?? "unknown"). Error: \(error.localizedDescription)")
    }
    
    // Optional: Handle changes in authorization status.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Location access granted.")
        case .denied, .restricted:
            print("Location access denied or restricted.")
        case .notDetermined:
            print("Location access not determined yet.")
        @unknown default:
            print("An unknown authorization status occurred.")
        }
    }
}
