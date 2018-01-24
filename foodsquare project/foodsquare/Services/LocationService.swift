//
//  LocationService.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

// This class will create a singlton of the loacationservice which is highly recomended from apple
class LocationService: NSObject {
    static let manager = LocationService()
    private var locationManager: CLLocationManager!
    private var geoCOder = CLGeocoder()
    private override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    }
}

//MARK: -  Location Status function
extension LocationService{
    public func checkForLocationServices()->CLAuthorizationStatus{
        let status = CLLocationManager.authorizationStatus()
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined: // intial state on first launch
                print("not determined")
                locationManager.requestWhenInUseAuthorization()
            case .denied: // user could potentially deny access
                print("denied")
            case .authorizedAlways:
                print("authorizedAlways")
            case .authorizedWhenInUse:
                print("authorizedWhenInUse")
            default:
                break
            }
        }
        return status
    }
}

//MARK: CLLoaction MnagerDelegates
extension LocationService: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations: \(locations)")
        
        guard let location = locations.last else { print("no location data"); return }
        
        // update user preferences
        UserPreference.manager.setLatitude(latitude: location.coordinate.latitude)
        UserPreference.manager.setLongitude(longitude: location.coordinate.longitude)
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangeAuthorization: \(status)") // e.g .denied, .notDetermined
    }
}

//Mark: GeoCoder Methods
extension LocationService {
    func getCityNameFromCLLocation(inputCLLocation: CLLocation, completion: @escaping (String)->Void) {
        DispatchQueue.main.async {
            self.geoCOder.reverseGeocodeLocation(inputCLLocation) { (placeMarks, error) in
                if let error = error{
                    print(error)
                }
                guard let place = placeMarks?.first else{
                    print("DEV: error getting places from the CLLocation")
                    return
                }
                // to get the city name use this
                guard let locality = place.locality else { return }
                completion(locality)
            }
        }
    }
    
    func getCityCordinateFromCityName(inputCityName: String, completion: @escaping (CLLocation)->Void, errorHandler:@escaping (Error)->Void){
        self.geoCOder.geocodeAddressString(inputCityName) { (placeMarks, error) in
            if let error = error{
                print(error)
                errorHandler(error)
            }
            guard let place = placeMarks?.first else{
                print("DEV: error getting places from the CLLocation")
                
                return
            }
            completion(place.location!)
        }
    }
}



