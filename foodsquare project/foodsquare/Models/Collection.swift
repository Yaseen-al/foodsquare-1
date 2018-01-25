//
//  Collection.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import UIKit
class Collection: Codable {
    var venues: [Venue]?
    var title: String
    var imageName: String
    init(venues: [Venue]?, title: String, imageName: String) {
        self.imageName = imageName
        self.venues = venues
        self.title = title
    }
}

