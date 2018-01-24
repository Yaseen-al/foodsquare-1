//
//  FoursquareAPISettings.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
//Client ID
//5CE5L2IZ3H2YJLGR0AW24ZHUSV0KFPY2JXLPBETXZPRCQZMD
//Client Secret
//PTPH4M12JCTMB3CCMLMIEWRRRX4QFWU0SFAP1J4IGHJVDIRS
import Foundation
struct FoursquareAPISettings {
    static let clientID = "\(APIKeys.clientID)"
    static let clientSecret = "\(APIKeys.clientSecret)"
    static let baseSearchURL = "https://api.foursquare.com/v2/venues/search?"
    static let basePhotoSearchURL = "https://api.foursquare.com/v2/venues/"
}
