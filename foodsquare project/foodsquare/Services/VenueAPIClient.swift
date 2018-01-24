//
//  VenueAPIClient.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Alamofire
import MapKit
struct VenueAFireAPIClient {
    private init(){}
    static let manager = VenueAFireAPIClient()
    func getVenues(searchTerm: String, location:CLLocation, completionHandler: @escaping ([Venue])->Void, errorHandler: @escaping (Error)->Void) {
        let urlStr = "\(FoursquareAPISettings.baseSearchURL)ll=\(location.coordinate.latitude),\(location.coordinate.longitude)&query=\(searchTerm)&client_id=\(FoursquareAPISettings.clientID)&client_secret=\(FoursquareAPISettings.clientSecret)&v=20180117"
        
        Alamofire.request(urlStr).response(queue: DispatchQueue.main) { (response) in
            if let error = response.error{
                errorHandler(error)
            }
            guard let data = response.data else{
                print("DEV: no data received")
                return
            }
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(VenueCall.self, from: data)
                completionHandler(results.response.venues)
            }catch let error{
                errorHandler(error)
            }
        }
    }
    
}
