//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Trey Browder on 1/12/24.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()

    let manager = CLLocationManager()
    
    var completion: (((lon: Double, lat: Double)) -> Void)?
    
    func getLocation(completion: (((lon: Double, lat: Double)) -> Void)?) {
        self.completion = completion
        
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        //once loaction is updated once you want to stop updating it - battery effeciency
        manager.stopUpdatingLocation()
        completion?((lon: location.coordinate.longitude, lat: location.coordinate.latitude))
    }
    
    //change a lat/lon location to a name
    func resolveName(For location: CLLocation, completion: @escaping (String?) -> Void) {
        let coder = CLGeocoder()
        
        coder.reverseGeocodeLocation(location) { places, error in
            guard let place = places?.first, error == nil else {
                return
            }
            
            var name = ""
            if let region = place.locality {
                name = region
            }
            
            if let city = place.administrativeArea {
                name += ", \(city)"
            }
            
            completion(name)
        }
    }
}
