//
//  Collection.swift
//  foodsquare
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
class Collection {
    var venues: [Venue]
    var title: String
    init(venues: [Venue], title: String) {
        self.venues = venues
        self.title = title
    }
}
