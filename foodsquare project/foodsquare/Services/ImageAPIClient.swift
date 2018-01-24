//
//  ImageAPIClient.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Alamofire
import MapKit
import UIKit

struct ImageAFireAPIClient {
    private init(){}
    static let manager = ImageAFireAPIClient()
    func getImages(urlStr: String, completionHandler: @escaping (UIImage)->Void, errorHandler: @escaping (Error)->Void) {
        
        Alamofire.request(urlStr).response(queue: DispatchQueue.main) { (response) in
            if let error = response.error{
                errorHandler(error)
                
            }
            guard let data = response.data else{
                print("DEV: no data received")
                return
            }
            if let image = UIImage(data: data){
                
                completionHandler(image)
            }
        }
    }
    
}
