//
//  PhotoAPIClient.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Alamofire
import MapKit
struct PhotoAFireAPIClient {
    private init(){}
    static let manager = PhotoAFireAPIClient()
    func getPhotosForVenue(venueID: String, completionHandler: @escaping ([Item])->Void, errorHandler: @escaping (Error)->Void) {
        let urlStr = "\(FoursquareAPISettings.basePhotoSearchURL)\(venueID)/photos?client_id=\(FoursquareAPISettings.clientID)&client_secret=\(FoursquareAPISettings.clientSecret)&v=20180117&limit=10"
        Alamofire.request(urlStr).response(queue: DispatchQueue.main){ (response) in
            if let error = response.error{
                errorHandler(error)
            }
            guard let data = response.data else{
                print("DEV: no data received")
                return
            }
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(AllData.self, from: data)
                completionHandler(results.response.photos.items)
            }catch let error{
                errorHandler(error)
            }
        }
    }
    
}
