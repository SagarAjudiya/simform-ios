//
//  CLLocationHelper.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 26/05/23.
//

import CoreLocation

class CLLocationHelper: NSObject {

    private override init() {
        super.init()
        checkLocationAuth()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100.0
    }

    // MARK: Variables
    static let shared = CLLocationHelper()
    private let locationManager = CLLocationManager()
    
    var locationCompletionHandler: ((CLLocation?) -> Void)?

    // iPhone location service check
    func checkLocationServices() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.checkLocationAuth()
            } else {
                print("Plaese enable location")
            }
        }
    }

    // patricular our app location check
    private func checkLocationAuth() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .denied:
            break
        default:
            break
        }
    }
    
}

// MARK: Extension CLLocationHelper
extension CLLocationHelper: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            locationCompletionHandler?(nil)
            return
        }
        
        locationManager.stopUpdatingLocation()
        locationCompletionHandler?(location)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        locationCompletionHandler?(nil)
    }
    
}

